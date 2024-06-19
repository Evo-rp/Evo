import React from 'react';
import { useSelector } from 'react-redux';
import { Fade } from '@mui/material';
import { makeStyles } from '@mui/styles';

import {
    Default as VehicleDefault,
    Simple as VehicleSimple,
    Gauge as VehicleGauge
} from '../../../components/Vehicle';
import { Center as Status } from '../../../components/Status';
import { Center as Buffs } from '../../../components/Buffs';

import VOIP from '../../../components/Status/components/VOIP';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        position: 'relative',
        height: '100%',
        width: '100%',
    },
    shifted: {
        position: 'absolute',
        bottom: 45,
    },
    standard: {
        position: 'absolute',
        bottom: 45,
        left: '1.35%',
    },
}));

export default () => {
    const classes = useStyles();
    const showing = useSelector((state) => state.hud.showing);

    const config = useSelector((state) => state.hud.config);
    const position = useSelector((state) => state.hud.position);

    const getVehicleLayout = () => {
        switch (config.vehicle) {
            case 'simple':
                return <VehicleSimple />;
            case 'gauge':
                return <VehicleGauge />;
            default:
                return <VehicleDefault />;
        }
    };

    return (
        <Fade in={showing}>
            <div className={classes.wrapper}>
                <div
                    className={classes.shifted}
                    style={{
                        left: `calc(${position.rightX * 100}% * 1.075)`,
                    }}
                >
                    {config.buffsAnchor == 'compass' && <Buffs />}
                    <VOIP />
                </div>
                {config.buffsAnchor == 'minimap' && <Buffs />}
                <Status />
                {getVehicleLayout()}
            </div>
        </Fade>
    );
};
