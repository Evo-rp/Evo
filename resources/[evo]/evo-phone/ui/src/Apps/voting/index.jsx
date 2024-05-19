import React, { useEffect, useMemo, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppBar, IconButton, Grid, Tooltip, ImageList, ImageListItem, ImageListItemBar, Accordion, AccordionSummary, Typography, AccordionDetails, List, ListItem, ListItemText, Divider, Button, Tabs, Tab, FormGroup, Checkbox, FormControlLabel, TextField, Box, LinearProgress, FormControl, Select, MenuItem } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import Nui from '../../util/Nui';
import { Modal } from '../../components';
import { throttle } from 'lodash';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        height: '100%',
        background: theme.palette.secondary.main,
    },
    inner: {
        position: 'relative',
        height: '100%',
    },
    votingContainer: {
        height: '82%',
        overflow: 'auto',
        padding: '0.5vh',
        '&::-webkit-scrollbar': {
            width: 6,
        },
        '&::-webkit-scrollbar-thumb': {
            background: '#ffffff52',
        },
        '&::-webkit-scrollbar-thumb:hover': {
            background: '#1de9b6',
        },
        '&::-webkit-scrollbar-track': {
            background: 'transparent',
        },
    },
    header: {
        background: '#787777',
        fontSize: 20,
        padding: 15,
        lineHeight: '45px',
        height: 78,
    },

    businessItem: {
        background: theme.palette.secondary.dark,
    },
    heading: {
        fontSize: theme.typography.pxToRem(15),
        flexBasis: '33.33%',
        flexShrink: 0,
    },
    secondaryHeading: {
        fontSize: theme.typography.pxToRem(15),
        color: theme.palette.text.secondary,
    },
    editField: {
        marginBottom: 15,
        '&::-webkit-scrollbar': {
            width: 6,
        },
        '&::-webkit-scrollbar-thumb': {
            background: '#ffffff52',
        },
        '&::-webkit-scrollbar-thumb:hover': {
            background: '#1de9b6',
        },
        '&::-webkit-scrollbar-track': {
            background: 'transparent',
        },
    },
}));

export default (props) => {
    const classes = useStyles();
    const dispatch = useDispatch()

    const [checkedBox, setCheckedBox] = useState(null);
    const [checkboxData, setCheckboxData] = useState('')
    const [open, setOpen] = useState(false)
    const [name, setName] = useState('')
    const [canSubmit, setCanSubmitVote] = useState(false)
    const [category, setCategory] = useState('')
    const [jobRestriction, setJobRestriction] = useState('')
    const myPermissions = useSelector((state) => state.data.data.player.PhonePermissions);
	const externalJobs = useSelector((state) => state.data.data.externalJobs);

    const handleCheck = (id) => {
        setCheckedBox(id);
    };

    const activeTab = useSelector((state) => state.voting.tab);
    const votes = useSelector((state) => state.voting.voted);
    const candidates = useSelector((state) => state.voting.candidates);

    const handleTabChange = (event, tab) => {
        dispatch({
            type: 'SET_VOTING_TAB',
            payload: { tab: tab },
        });
    };

    const onButtonClick = async (event) => {
        try {
            let res = await (await Nui.send('Phone:Voting:Vote', { vote: checkboxData, person: checkedBox })).json();

            if (res) {
                showAlert(res ? 'Vote Submitted' : 'Something went wrong.');
                return true;
            } else {
                return false;
            }
        } catch (err) {
            console.log(err);
            return false;
        }
    };

    const fetch = useMemo(() => throttle(async () => {
        try {
            let res = await (await Nui.send('Phone:Voting:GetCandidates')).json();

            if (res) {
                getVotes(res)
                dispatch({
                    type: 'SET_VOTING_CANDIDATES',
                    payload: {
                        data: res,
                    },
                });
            } else {
                throw res;
            }
        } catch (err) {
            // console.log(err)
            // console.log('[ERROR] Error in Voting app')
        }
    }, 5000), []);

    const getVotes = async (options) => {   
        const candidateKeys = Object.keys(options);
        
        for (const key of candidateKeys) {
            try {
                let res = await (await Nui.send('Phone:Voting:GetVotes', {
                    vote: key,
                })).json();

                if (res) {
                    dispatch({
                        type: 'SET_VOTES_DONE',
                        payload: {
                            data: res
                        },
                    });
                }
            } catch (error) {
                // console.error('Error fetching votes:', error);
            }
        }
    };

    useEffect(() => {
        fetch();
    }, []);

    const createCandidate = async (data) => {
        try {
            let res = await (await Nui.send('Phone:Voting:CreateCandidate', data)).json();

            if (res) {
                setOpen(false);
                setName('');
                return true;
            } else {
                return false;
            }
        } catch (err) {
            console.log(err);
            return false;
        }
    };

    const onCreate = async (e) => {
        let res = await createCandidate({
            name: name,
            category: category,
            jobRestriction: jobRestriction
        });
        setName('');
        setOpen(false);
        showAlert(res ? 'Candidate Added' : 'Could not create Candidate');
        setTimeout(() => {
            fetch();
        }, 700)
    };

    const shouldHide = (data) => {
        console.log(data)
        if (data === '' || data === 'none') {
            return ''
        }

        if (data) {
            return ''
        } else {
            return 'none'
        }
    }
    
    return (
        <div className={classes.wrapper}>
            <div className={classes.inner}>
                <AppBar position="static" className={classes.header}>
                    <Grid container>
                        <Grid item xs={8} style={{ lineHeight: '50px' }}>
                            Voting
                        </Grid>

                        <Grid item xs={4} style={{ textAlign: 'right', display: myPermissions.voting.admin ? '' : 'none' }}>
                            <Tooltip
                                title='Add Candidate'
                            >
                                <IconButton
                                    onClick={() => setOpen(true)}
                                >
                                    <FontAwesomeIcon icon={['fas', 'plus']} />
                                </IconButton>
                            </Tooltip>
                        </Grid>
                    </Grid>
                </AppBar>

                <div
                    className={classes.votingContainer}
                >
                    <FormGroup style={{ marginLeft: 20, display: activeTab === 0 ? '' : 'none' }}>
                        {Object.keys(candidates).map(group => (
                            <div key={group} style={{ display: shouldHide(candidates[group][0].restricted), marginBottom: 20 }}>
                                <h3>{group}</h3>
                                {candidates[group].map(checkbox => (
                                    <div key={checkbox.id} style={{ marginBottom: 10 }}>
                                        <FormControlLabel
                                            control={
                                                <Checkbox
                                                    checked={checkedBox === checkbox.id}
                                                    onChange={(e) => {
                                                        handleCheck(checkbox.id)
                                                        setCanSubmitVote(true)
                                                        setCheckboxData(checkbox.vote_category);
                                                    }}
                                                    sx={{ '& .MuiSvgIcon-root': { fontSize: 28 } }}
                                                    disabled={votes[`VOTED_${group}`]}
                                                />
                                            }
                                            label={
                                                <>
                                                    {checkbox.label}
                                                    <IconButton
                                                        disabled={!myPermissions.voting.admin}
                                                        onClick={async() => {
                                                            try {
                                                                let res = await (await Nui.send('Phone:Voting:RemoveCandidate', { id: checkbox.id })).json();
                                                    
                                                                if (res) {
                                                                    setTimeout(() => {
                                                                        fetch();
                                                                    }, 700)
                                                                    return true;
                                                                } else {
                                                                    return false;
                                                                }
                                                            } catch (err) {
                                                                console.log(err);
                                                                return false;
                                                            }
                                                        }}
                                                    >
                                                        <FontAwesomeIcon style={{ color: 'red', display: myPermissions.voting.admin ? '' : 'none' }} icon={['fa', 'trash']} />
                                                    </IconButton>
                                                </>
                                            }
                                        />
                                    </div>
                                ))}
                            </div>
                        ))}
                    </FormGroup>

                    <Button
                        variant='contained'
                        disabled={!canSubmit}
                        style={{ height: '4vh', fontSize: '1.5vh', position: 'absolute', bottom: 60, width: '97.5%', marginLeft: '0.5%', display: activeTab === 0 ? '' : 'none' }}
                        onClick={onButtonClick}
                    >
                        Submit Vote
                    </Button>

                    <Box sx={{ width: '100%', padding: 2, display: activeTab === 1 ? '' : 'none' }}>
                        <FormGroup style={{ marginLeft: 20, display: activeTab === 1 ? '' : 'none' }}>
                            {Object.keys(candidates).map(group => (
                                <div key={group} style={{ marginBottom: 20 }}>
                                    <h3>{group}</h3>
                                    {candidates[group].map(data => (
                                        <div key={data.id} style={{ marginBottom: 10 }}>
                                            <Box key={data.id} sx={{ marginBottom: 2 }}>
                                                <Typography variant="h6" gutterBottom>
                                                    {data.label} - {data.votes} Votes
                                                </Typography>
                                                <Box sx={{ display: 'flex', alignItems: 'center', marginTop: 1 }}>
                                                    <Box sx={{ width: '100%', right: 1 }}>
                                                        <LinearProgress variant="determinate" value={(data.votes / 500) * 100} />
                                                    </Box>
                                                </Box>
                                            </Box>
                                        </div>
                                    ))}
                                </div>
                            ))}
                        </FormGroup>
                    </Box>
                </div>

                <div className={classes.tabs}>
                    <Tabs
                        value={activeTab}
                        onChange={handleTabChange}
                        indicatorColor="primary"
                        textColor="primary"
                        variant="fullWidth"
                        scrollButtons={false}
                    >
                        <Tab
                            className={classes.phoneTab}
                            label="Vote"
                        />
                        <Tab
                            className={classes.phoneTab}
                            disabled={!myPermissions.voting.admin}
                            label="Results"
                        />
                    </Tabs>
                </div>
            </div>
            <Modal
                form
                open={open}
                title="Add Candidate"
                onClose={() => setOpen(false)}
                onAccept={onCreate}
                submitLang="Add"
                closeLang="Cancel"
            >
                <TextField
                    className={classes.editField}
                    label="Name"
                    name="name"
                    type="text"
                    fullWidth
                    multiline
                    required
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    inputProps={{
                        maxLength: 180,
                    }}
                    InputLabelProps={{
                        style: { fontSize: 20 },
                    }}
                />

                <TextField
                    className={classes.editField}
                    label="Job Restriction"
                    name="restriction"
                    type="text"
                    fullWidth
                    multiline
                    required
                    value={jobRestriction}
                    onChange={(e) => setJobRestriction(e.target.value)}
                    inputProps={{
                        maxLength: 180,
                    }}
                    InputLabelProps={{
                        style: { fontSize: 20 },
                    }}
                />

                <FormControl fullWidth>
                    <Select
                        labelId="demo-simple-select-standard-label"
                        id="demo-simple-select-standard"
                        value={category}
                        onChange={(e) => setCategory(e.target.value)}
                    >
                        <MenuItem value={'Commissioner'}>Commissioner</MenuItem>
                        <MenuItem value={'Mayor'}>Mayor</MenuItem>
                    </Select>
                </FormControl>
            </Modal>
        </div>
    );
};
