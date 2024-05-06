import React from 'react';
import { useSelector } from 'react-redux';
import { useTheme } from '@mui/material';
import { makeStyles, withTheme } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { CSSTransition, TransitionGroup } from 'react-transition-group';

export default withTheme(() => {
    const theme = useTheme();

    const config = useSelector((state) => state.hud.config);
    const inVeh = useSelector((state) => state.vehicle.showing);
    const isDead = useSelector((state) => state.status.isDead);
    const health = useSelector((state) => state.status.health);
    const armor = useSelector((state) => state.status.armor);
    const statuses = useSelector((state) => state.status.statuses);
    const fuelHide = useSelector((state) => state.vehicle.fuelHide);
    const fuel = useSelector((state) => state.vehicle.fuel);

    const useStyles = makeStyles((theme) => ({
        status: {
            position: 'absolute',
            margin: 'auto',
            fontSize: 30,
            textAlign: 'center',
            filter: 'drop-shadow(0 0 2px #000000)',
            whiteSpace: 'nowrap',
            overflow: 'hidden',
            display: 'flex',
            left: 10,
            right: 0,
            bottom: 2.5,
            flexDirection: 'row',
            padding: 2.5
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
        iconProg: {
            position: 'absolute',
            height: 5,
            left: 0,
            right: 0,
            bottom: 0,
            margin: 'auto',
            zIndex: 5,
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
        },
        errorIcon: {
            color: theme.palette.error.light,
        },
        '@keyframes flash': {
            '0%': {
                opacity: 1,
            },
            '50%': {
                opacity: 0.1,
            },
            '100%': {
                opacity: 1,
            },
        },
    }));

    const classes = useStyles();

    const GetFuel = () => {
        if (!inVeh || fuelHide) return null;
        return (
            <CSSTransition key="fuel" timeout={500} classNames="fade">
                <div
                    key="fuel"
                    className={`${classes.iconWrapper}${
                        fuel <= 10 ? ' low' : ''
                    }`}
                >
                    {(config.statusIcons || config.statusNumbers) && (
                        <div className={classes.iconAvatar}>
                            {config.statusNumbers ? (
                                <span>{fuel}</span>
                            ) : (
                                <FontAwesomeIcon icon="gas-pump" />
                            )}
                        </div>
                    )}
                    <div className={classes.barBg}>
                        <div
                            className={classes.bar}
                            style={{
                                background: theme.palette.warning.main,
                                height: `${fuel}%`,
                            }}
                        />
                    </div>
                </div>
            </CSSTransition>
        );
    };

    const GetHealth = () => {
        if (isDead) {
            return (
                <CSSTransition key="health" timeout={500} classNames="fade">
                    <div className={classes.iconWrapper}>
                        <div className={classes.barBg}>
                            <div
                                className={classes.bar}
                                style={{
                                    background: 'red',
                                    height: `100%`,
                                }}
                            />
                        </div>
                        {(config.statusIcons || config.statusNumbers) && (
                            <div className={classes.iconAvatar}>
                                <FontAwesomeIcon icon="skull-crossbones" />
                            </div>
                        )}
                    </div>
                </CSSTransition>
            );
        } else {
            return (
                <CSSTransition key="health" timeout={500} classNames="fade">
                    <div
                        className={`${classes.iconWrapper}${
                            health <= 10 ? ' low' : ''
                        }`}
                    >
                        {(config.statusIcons || config.statusNumbers) && (
                            <div className={classes.iconAvatar}>
                                {config.statusNumbers ? (
                                    <span>{health}</span>
                                ) : (
                                    <FontAwesomeIcon icon="heart" />
                                )}
                            </div>
                        )}
                        <div className={classes.barBg}>
                            <div
                                className={classes.bar}
                                style={{
                                    background: theme.palette.success.main,
                                    height: `${health}%`,
                                }}
                            />
                        </div>
                    </div>
                </CSSTransition>
            );
        }
    };

    const GetArmor = () => {
        if (armor <= 0 || isDead) return null;
        return (
            <CSSTransition key="armor" timeout={500} classNames="fade">
                <div className={classes.iconWrapper}>
                    <div className={classes.barBg}>
                        <div
                            className={classes.bar}
                            style={{
                                background: theme.palette.info.main,
                                height: `${armor}%`,
                            }}
                        />
                    </div>

                    {(config.statusIcons || config.statusNumbers) && (
                        <div className={classes.iconAvatar}>
                            {config.statusNumbers ? (
                                <span>{armor}</span>
                            ) : (
                                <FontAwesomeIcon icon="shield" />
                            )}
                        </div>
                    )}
                </div>
            </CSSTransition>
        );
    };

    const elements = statuses.sort((a, b) => a.options.id - b.options.id).map((status, i) => {
        if (
            (status.value >= 90 && status?.options?.hideHigh) ||
            (status.value == 0 && status?.options?.hideZero) ||
            (isDead && !status?.options?.visibleWhileDead)
        )
            return null;

        return (
            <CSSTransition
                key={`status-${i}`}
                timeout={500}
                classNames="fade"
            >
                <div
                    className={`${classes.iconWrapper}${
                        ((!status.inverted && status.value <= 10) ||
                            (status.inverted && status.value >= 90)) &&
                        status.flash
                            ? ' low'
                            : ''
                    }`}
                >
                    {(config.statusIcons || config.statusNumbers) && (
                        <div className={classes.iconAvatar}>
                            {config.statusNumbers ? (
                                <span>{status.value}</span>
                            ) : (
                                <FontAwesomeIcon
                                    icon={status.icon ?? 'question'}
                                />
                            )}
                        </div>
                    )}
                    <div className={classes.barBg}>
                        <div
                            className={classes.bar}
                            style={{
                                background: status.color
                                    ? status.color
                                    : theme.palette.text.main,
                                height: `${status.value}%`,
                            }}
                        />
                    </div>
                </div>
            </CSSTransition>
        );
    });

    elements.unshift(GetArmor());
    elements.unshift(GetHealth());
    elements.unshift(GetFuel());

    return (
        <TransitionGroup className={classes.status}>{elements}</TransitionGroup>
    );
});