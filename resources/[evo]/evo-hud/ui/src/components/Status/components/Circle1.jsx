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
    bar: {
        position: 'absolute',
        height: 50,
        width: 50,
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        margin: 'auto',
    },
    background: {
        position: 'absolute',
        height: 50,
        width: 50,
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        margin: 'auto',
        zIndex: -1,
        background: theme.palette.secondary.dark,
        color: theme.palette.text.main,
        fontSize: 16,
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
                <CircularProgress
                    className={classes.bar}
                    variant="determinate"
                    value={
                        Boolean(status?.options?.customMax)
                            ? (status.value / status?.options?.customMax) * 100
                            : status.value
                    }
                    thickness={5}
                    size={50}
                    style={{ color: status.color }}
                />
                <Avatar className={classes.background}>
                    {config.circleNumbers && !status?.options?.forceIcon ? (
                        <span className={classes.number}>
                            {status.value}
                            <FontAwesomeIcon
                                className="faded"
                                icon={status.icon}
                            />
                        </span>
                    ) : (
                        <FontAwesomeIcon icon={status.icon} />
                    )}
                </Avatar>
            </div>
        </Fade>
    );
});
