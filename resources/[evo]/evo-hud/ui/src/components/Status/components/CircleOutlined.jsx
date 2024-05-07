import React from 'react';
import { useSelector } from 'react-redux';
import { useTheme } from '@mui/material';
import { makeStyles, withTheme } from '@mui/styles';
import { CSSTransition, TransitionGroup } from 'react-transition-group';

import Circle from './Circle1';
// import CirlceBuffs from '../../Buffs/layouts/Circles';

const useStyles = makeStyles((theme) => ({
    status: {
        fontSize: 30,
        width: 'fit-content',
        textAlign: 'center',
        marginBottom: 4,
    },
    icons: {
        display: 'flex',
        gap: 6,
        flexFlow: 'wrap-reverse',
        marginBottom: 4,
    },
}));

export default withTheme(({ status }) => {
    const classes = useStyles();
    const isDead = useSelector((state) => state.status.isDead);
    const config = useSelector((state) => state.hud.config);

    if (
        (status.options.hideZero && status.value <= 0) ||
        (status.value >=
            (Boolean(status?.options?.customMax)
                ? status?.options?.customMax / 0.9
                : 90) &&
            status?.options?.hideHigh) ||
        (status.value == 0 && status?.options?.hideZero) ||
        (isDead && !status?.options?.visibleWhileDead)
    )
        return null;

    return (
        <>
            <TransitionGroup className={classes.status}>
                <>
                    <div
                        className={classes.icons}
                        style={
                            config.condenseAlignment == 'compass'
                                ? {
                                      width: 255,
                                  }
                                : {
                                      width: '100%',
                                  }
                        }
                    >
                        <Circle status={status} />
                        {/* <CirlceBuffs /> */}
                    </div>
                </>
            </TransitionGroup>
        </>
    );
});
