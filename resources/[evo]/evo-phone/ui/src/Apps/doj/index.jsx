import React, { useEffect, useMemo, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { TextField, IconButton, Grid, MenuItem, FormControl, Select, ListItem, ListItemText } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import Nui from '../../util/Nui';
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
    employeesContainer: {
        height: '89%',
        overflow: 'auto',
        marginTop: '1vh',
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
    search: {
        height: '10%',
    },
    searchInput: {
        width: '90%',
        marginLeft: '5.5%',
        height: '100%',
    },
}));

export default (props) => {
    const classes = useStyles();
    const doj = useSelector((state) => state.data.data.doj);
    const dispatch = useDispatch()

    const [searchVal, setSearchVal] = useState('');
    const onSearchChange = (e) => {
        setSearchVal(e.target.value);
    };

    const [type, setType] = useState('All')

    const fetch = useMemo(() => throttle(async () => {
        try {
            let res = await (await Nui.send('DOJ:GetData')).json();
            if (res) {
                dispatch({
                    type: 'SET_DATA',
                    payload: {
                        type: 'doj',
                        data: res,
                    },
                });
            } else {
                throw res;
            }
        } catch (err) {
            // console.log(err)
            // console.log('[ERROR] Error in DOJ app')
        }
    }, 5000), []);

    useEffect(() => {
        fetch();
    }, []);

    return (
        <div className={classes.wrapper}>
            <div className={classes.inner}>
                <div className={classes.search}>
                    <TextField
                        variant="standard"
                        className={classes.searchInput}
                        label="Search..."
                        value={searchVal}
                        onChange={onSearchChange}
                    />
                </div>
                <FormControl variant="standard" sx={{ left: '5.5%', minWidth: '90%' }}>
                    <Select
                        labelId="demo-simple-select-standard-label"
                        id="demo-simple-select-standard"
                        value={type}
                        onChange={(e) => setType(e.target.value)}
                    >
                        <MenuItem value={'All'}>All</MenuItem>
                        <MenuItem value={'Chief Public Defender'}>Chief Public Defender</MenuItem>
                        <MenuItem value={'Public Defender'}>Public Defender</MenuItem>
                        <MenuItem value={'District Attorney'}>District Attorney</MenuItem>
                        <MenuItem value={'Asst. District Attorney'}>Asst. District Attorney</MenuItem>
                        <MenuItem value={'Superior Court Judge'}>Superior Court Judge</MenuItem>
                        <MenuItem value={'Judge'}>Judge</MenuItem>
                    </Select>
                </FormControl>

                <div
                    className={classes.employeesContainer}
                >
                    {doj.length > 0 && doj.map((data) => {
                        if (searchVal !== '') {
                            if (!data.Name.includes(searchVal)) return;
                        }
                        if (type !== 'All' && type !== data.Rank) return;
                        if (!data.Rank === 'Judge' || !data.Rank === 'Superior Court Judge' || !data.Rank === 'Asst. District Attorney' || !data.Rank === 'District Attorney' || !data.Rank === 'Public Defender' || !data.Rank === 'Chief Public Defender') return;

                        return (
                            <ListItem
                                key={data.Number}
                                button
                                disableRipple
                                style={{
                                    width: '90%',
                                    marginLeft: '5.5%'
                                }}
                            >
                                <Grid container justifyContent="space-between">
                                    <Grid item xs={5}>
                                        <ListItemText
                                            primary={data.Name}
                                            secondary={data.Rank}
                                        />
                                    </Grid>

                                    <Grid item xs={2} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                                        <IconButton
                                            onClick={() => Nui.send('DOJ:Call', { number: data.Number })}
                                        >
                                            <FontAwesomeIcon
                                                icon={['fa', 'phone']}
                                            />
                                        </IconButton>
                                    </Grid>
                                </Grid>
                            </ListItem>
                        )
                    })}

                    {doj.length <= 0 &&
                        <div
                            style={{
                                display: 'flex',
                                flexDirection: 'column',
                                justifyContent: 'center',
                                alignItems: 'center',
                                marginTop: '10vh'
                            }}
                        >
                            <FontAwesomeIcon
                                icon={['fa', 'gavel']}
                                style={{
                                    fontSize: '10vh',
                                    color: '#4154B6'
                                }}
                            />

                            <span style={{ fontSize: '2vh', marginTop: '2vh' }}>No DOJ On duty.</span>
                        </div>
                    }
                </div>
            </div>
        </div>
    );
};
