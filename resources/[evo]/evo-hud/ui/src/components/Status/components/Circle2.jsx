import React from 'react';
import { Avatar, CircularProgress, Fade } from '@mui/material';
import { makeStyles, withTheme } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { useSelector } from 'react-redux';

const useStyles = makeStyles((theme) => ({
    status: {
        position: 'relative',
        height: 50,
        width: 50,
        filter: 'drop-shadow(0 0 2px #000000)',
    },
    iconWrapper: {
        position: 'relative',
        height: 50,
        width: 50,

        '&:not(:last-of-type)': {
            marginRight: 10,
        },
        '&.low': {
            animation: '$flash linear 1s infinite',
        },
    },
    barBg: {
        position: 'absolute',
        height: 50,
        left: 0,
        right: 0,
        bottom: 0,
        margin: 'auto',
        zIndex: 5,
        boxShadow: '0 0 5px #000',
        background: theme.palette.secondary.dark,
        border: `1px solid ${theme.palette.border.divider}`,
        zIndex: 0,
        borderRadius: '50%',
        transform: 'rotate(-180deg)',
        overflow: 'hidden'
    },
    bar: {
        maxWidth: '100%',
        height: '100%',
        transition: 'width ease-in 0.15s',
    },
    iconAvatar: {
        position: 'absolute',
        top: 0,
        zIndex: 1,
        left: 0,
        right: 0,
        bottom: 0,
        margin: 'auto',
        '& svg, & span': {
            position: 'absolute',
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            margin: 'auto',
            fontSize: 50 / 2.2727,
            textShadow: '0 0 5px #000',
            color: theme.palette.text.main,
        },
    }
}));

export default withTheme(({ status }) => {
    const config = useSelector((state) => state.hud.config);
    const classes = useStyles({ status, config });

    return (
        <Fade in={true}>
            <div className={classes.status}>
                <div className={classes.iconWrapper}>
                    <div className={classes.barBg}>
                        <div
                            className={classes.bar}
                            style={{
                                background: status.color,
                                height: `${status.value}%`,
                            }}
                        />
                    </div>
                    {!config.circleNumbers && !status?.options?.forceIcon &&
                        <div className={classes.iconAvatar}>
                            <FontAwesomeIcon icon={status.icon} />
                        </div>
                    }
                </div>
            </div>
        </Fade>
    );
});
