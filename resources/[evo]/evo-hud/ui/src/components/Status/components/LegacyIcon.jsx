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
    },
    iconWrapper: {
        position: 'relative',
        height: 50,
        width: 50,
        fontSize: 15,
        '&:not(:last-of-type)': {
            marginRight: 20,
        },
        '&.low': {
            animation: '$flash linear 1s infinite',
        },
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
    },
    barBg: {
        position: 'absolute',
        height: 7,
        left: 0,
        right: 0,
        bottom: 0,
        margin: 'auto',
        zIndex: 5,
        boxShadow: '0 0 5px #000',
        background: theme.palette.secondary.dark,
        border: `1px solid ${theme.palette.border.divider}`,
    },
    bar: {
        maxWidth: '100%',
        height: '100%',
        transition: 'width ease-in 0.15s',
    },
    number: {
        zIndex: 1,

        '& svg': {
            display: 'block',
            width: 22,
            height: 22,
            fontSize: 22,
            position: 'absolute',
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            margin: 'auto',
            zIndex: 0,

            '&.faded': {
                opacity: 0.17,
            },
        },
    },
}));

export default withTheme(({ status }) => {
    const config = useSelector((state) => state.hud.config);
    const classes = useStyles({ status, config });

    return (
        <Fade in={true}>
            <div className={classes.status}>
                <div
                    className={`${classes.iconWrapper}${status.value <= 10 ? ' low' : ''}`}
                >
                    {!config.circleNumbers && !status?.options?.forceIcon &&
                        <div className={classes.iconAvatar}>
                            {config.statusNumbers ? (
                                <span>{status.value}</span>
                            ) : (
                                <FontAwesomeIcon icon={status.icon} />
                            )}
                        </div>
                    }
                    <div className={classes.barBg}>
                        <div
                            className={classes.bar}
                            style={{
                                background: status.color,
                                width: `${status.value}%`,
                            }}
                        />
                    </div>
                </div>
            </div>
        </Fade>
    );
});
