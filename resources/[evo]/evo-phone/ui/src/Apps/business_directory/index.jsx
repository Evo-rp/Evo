import React, { useEffect, useMemo, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { AppBar, IconButton, Grid, Accordion, AccordionSummary, Typography, AccordionDetails, List, ListItem, ListItemText } from '@material-ui/core';
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
    businessesContainer: {
        height: '89%',
        overflow: 'auto',
        '&::-webkit-scrollbar': {
            width: 6,
        },
        '&::-webkit-scrollbar-thumb': {
            background: '#ffffff52',
        },
        '&::-webkit-scrollbar-thumb:hover': {
            background: '#1de9b6',
        },
    },
    header: {
        background: '#d68111',
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
}));

export default (props) => {
    const classes = useStyles();
    const openBusinesses = useSelector((state) => state.data.data.openBusinesses);
    const dispatch = useDispatch()

    const [expanded, setExpanded] = useState(null);

    const fetch = useMemo(() => throttle(async () => {
        try {
            let res = await (await Nui.send('BusinessDirectory:Get:Data')).json();
            if (res) {
                dispatch({
                    type: 'SET_DATA',
                    payload: {
                        type: 'openBusinesses',
                        data: res,
                    },
                });
            } else {
                throw res;
            }
        } catch (err) {
            // console.log(err)
            // console.log('[ERROR] Error in Business Directory app')
        }
    }, 5000), []);

    useEffect(() => {
        fetch();
    }, []);

    return (
        <div className={classes.wrapper}>
            <div className={classes.inner}>
                <AppBar position="static" className={classes.header}>
                    <Grid container>
                        <Grid item xs={8} style={{ lineHeight: '50px' }}>
                            Business Directory
                        </Grid>
                    </Grid>
                </AppBar>

                {openBusinesses.length > 0 &&
                    <div
                        className={classes.businessesContainer}
                    >
                        {openBusinesses.map((data, k) => {
                            return (
                                <Accordion
                                    key={k}
                                    className={classes.businessItem}
                                    expanded={expanded === k}
                                    onChange={
                                        expanded === k
                                            ? () => setExpanded(null)
                                            : () => setExpanded(k)
                                    }
                                >
                                    <AccordionSummary
                                        expandIcon={
                                            <FontAwesomeIcon
                                                icon={['fas', 'chevron-down']}
                                            />
                                        }
                                    >
                                        <Typography className={classes.heading}>
                                            {data.Name}

                                            {/* <IconButton
                                                onClick={(e) => {
                                                    e.stopPropagation()
                                                }}
                                            >
                                                <FontAwesomeIcon
                                                    icon={['fa', 'map-pin']}
                                                />
                                            </IconButton> */}
                                        </Typography>
                                    </AccordionSummary>
                                    <AccordionDetails>
                                        <List>
                                            {data.Employees.map((data) => {
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
                                                                    onClick={() => Nui.send('BusinessDirectory:Call', { number: data.Number })}
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
                                        </List>
                                    </AccordionDetails>
                                </Accordion>
                            )
                        })}
                    </div>
                }

                {openBusinesses.length <= 0 &&
                    <div
                        className={classes.businessesContainer}
                    >
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
                                icon={['fa', 'briefcase']}
                                style={{
                                    fontSize: '10vh',
                                    color: '#d68111'
                                }}
                            />

                            <span style={{ fontSize: '2vh', marginTop: '2vh' }}>No Businesses Open.</span>
                        </div>
                    </div>
                }
            </div>
        </div>
    );
};
