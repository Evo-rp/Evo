import React, { useEffect, useState } from 'react';
import { connect } from 'react-redux';
import { Grid, LinearProgress, Fade } from '@mui/material';
import { withStyles, makeStyles } from '@mui/styles';
import useInterval from 'react-useinterval';

import Nui from '../../util/Nui';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        width: '100%',
        maxWidth: 500,
        height: 'fit-content',
        position: 'absolute',
        bottom: '15%',
        left: 0,
        right: 0,
        margin: 'auto',
    },
    label: {
        color: theme.palette.text.main,
        fontSize: 18,
        textShadow: '0 0 5px #000',
    },
    progressbar: {
        transition: 'none !important',
    },
}));

const mapStateToProps = (state) => ({
    showing: state.progress.showing,
    failed: state.progress.failed,
    cancelled: state.progress.cancelled,
    finished: state.progress.finished,
    label: state.progress.label,
    duration: state.progress.duration,
    startTime: state.progress.startTime,
});

export default connect(mapStateToProps)(
    ({ cancelled, finished, failed, label, duration, startTime, dispatch }) => {
        const classes = useStyles();

        const BorderLinearProgress = withStyles((theme) => ({
            root: {
                marginLeft: '0.8vh',
                position: 'absolute',
                paddingTop: '2vh',
                borderRadius: '0.6vh',
                height: '2.2vh',
                width: '90%',
            },
            colorPrimary: {
                backgroundColor: 'rgba(18, 18, 18, 0.7)',
            },
        }))(LinearProgress);

        const [curr, setCurr] = useState(0);
        const [fin, setFin] = useState(true);
        const [to, setTo] = useState(null);

        useEffect(() => {
            setCurr(0);
            setFin(true);
            if (to) {
                clearTimeout(to);
            }
        }, [startTime]);

        useEffect(() => {
            return () => {
                if (to) clearTimeout(to);
            };
        }, []);

        useEffect(() => {
            return () => {
                if (to) clearTimeout(to);
            };
        }, []);

        useEffect(() => {
            if (cancelled || finished || failed) {
                setCurr(0);
                setTo(
                    setTimeout(() => {
                        setFin(false);
                    }, 2000),
                );
            }
        }, [cancelled, finished, failed]);

        const tick = () => {
            if (failed || finished || cancelled) return;

            if (curr + 10 > duration) {
                dispatch({
                    type: 'FINISH_PROGRESS',
                });
            } else {
                setCurr(curr + 10);
            }
        };

        const hide = () => {
            dispatch({
                type: 'HIDE_PROGRESS',
            });
        };

        useInterval(tick, curr > duration ? null : 10);
        return (
            <Fade in={fin} duration={1000} onExited={hide}>
                <div className={classes.wrapper}>
                    <Grid container className={classes.label}>
                        <Grid item xs={5.5} style={{ marginLeft: '1vh' }}>
                            {finished
                                ? 'Finished'
                                : failed
                                    ? 'Failed'
                                    : cancelled
                                        ? 'Cancelled'
                                        : label}
                        </Grid>
                        <Grid item xs={5} style={{ textAlign: 'right' }}>
                            {!cancelled && !finished && !failed && (
                                <small>
                                    {Math.round(curr / 1000)}s /{' '}
                                    {Math.round(duration / 1000)}s
                                </small>
                            )}
                        </Grid>
                    </Grid>
                    <BorderLinearProgress
                        variant="determinate"
                        classes={{
                            colorPrimary: classes.colorPrimary,
                        }}
                        value={
                            cancelled || finished || failed
                                ? 100
                                : (curr / duration) * 100
                        }
                    />
                </div>
            </Fade>
        );
    },
);