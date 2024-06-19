import React, { useEffect } from 'react';
import { useSelector } from 'react-redux';
import {
    Fade,
    Slide,
} from '@mui/material';
import { makeStyles } from '@mui/styles';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        position: 'absolute',
        width: '100%',
        height: '100%',
        userSelect: 'none',
        overflow: 'hidden',
    },
    ammoWrapper: {
        position: 'absolute',
        right: 20,
        top: 0,
        margin: '0.6vh',
    },
    ammoContainer: {
        display: 'inline-block',
        position: 'relative',
        margin: '0.3vh',
        fontSize: '4vh',
        fontVariant: 'all-small-caps',
        whiteSpace: 'nowrap',
        fontWeight: 800,
        filter: 'drop-shadow(0 0 0.1vh black)',
        color: 'white',
    }
}));

export default () => {
    const classes = useStyles();
    const showing = useSelector((state) => state.Ammo.showing);
    const onlyTotal = useSelector((state) => state.Ammo.onlyTotal);
    const Total = useSelector((state) => state.Ammo.Total);
    const Clip = useSelector((state) => state.Ammo.Clip);

    return (
        <div className={classes.wrapper}>
            <Slide in={showing} direction="left" timeout={100} mountOnEnter unmountOnExit>
                <div className={classes.ammoWrapper}>
                    <div className={classes.ammoContainer}>
                        <div style={{ color: '#9e9e9e' }}>{!onlyTotal ? Clip : Total}</div>
                    </div>
                    <Fade in={!onlyTotal} mountOnEnter unmountOnExit>
                        <div className={classes.ammoContainer}>
                            <div style={{ color: '#9e9e9e' }}>{onlyTotal ? Total : `/ ${Total}`}</div>
                        </div>
                    </Fade>
                </div>
            </Slide>
        </div>
    );
};
