import React, { useState } from 'react';
import {
    Dialog,
    DialogTitle,
    DialogContent,
    DialogActions,
    Button,
    TextField,
    MenuItem,
    Grid,
    FormControlLabel,
    Switch,
} from '@mui/material';
import { useDispatch, useSelector } from 'react-redux';
import { makeStyles } from '@mui/styles';
import Bars from './forms/status-types/Bars';
import Nui from '../../util/Nui';
import { useEffect } from 'react';
import Minimap from './forms/layouts/Minimap';
import Center from './forms/layouts/Center';

import VehicleDefault from './forms/vehicle-layouts/Default';
import VehicleSimple from './forms/vehicle-layouts/Simple';

const layouts = [
    {
        value: 'default',
        label: 'Default',
    },
    {
        value: 'minimap',
        label: 'Status Anchored Below Minimap',
    },
    {
        value: 'center',
        label: 'Status Anchored Bottom Center',
    },
];

const vehLayouts = [
    {
        value: 'default',
        label: 'Default',
    },
    {
        value: 'simple',
        label: 'Simplified',
    },
    {
        value: 'gauge',
        label: 'Gauge',
    },
];

const actionLayouts = [
    {
        value: 'legacy',
        label: 'Legacy',
    },
    {
        value: 'boxed',
        label: 'Boxed',
    }
];

const barTypes = [
    {
        value: 'legacy',
        label: 'Legacy',
    },
    {
        value: 'numbers',
        label: 'Numbers',
    },
    {
        value: 'bars',
        label: 'Bars',
    },
    {
        value: 'circlesoutlined',
        label: 'Outlined Circles',
    },
    {
        value: 'circlesfilled',
        label: 'Filled Circles',
    },
];

const useStyles = makeStyles((theme) => ({
    form: {
        padding: 10,
        maxHeight: 600,
    },
    header: {
        display: 'block',
        fontSize: '1.17em',
        marginBlockEnd: '1em',
        fontWeight: 'bold',
    },
    field: {
        marginBottom: 10,
    },
}));

export default () => {
    const classes = useStyles();
    const dispatch = useDispatch();

    const isOpen = useSelector((state) => state.hud.settings);
    const config = useSelector((state) => state.hud.config);

    const [state, setState] = useState({ ...config });

    useEffect(() => {
        setState({ ...config });
    }, [isOpen]);

    const onClose = () => {
        dispatch({
            type: 'TOGGLE_SETTINGS',
            payload: {
                state: false,
            },
        });
        Nui.send('CloseUI');
    };

    const onChange = (e) => {
        setState({
            ...state,
            [e.target.name]: e.target.value,
        });
    };

    const onChecked = (e) => {
        setState({
            ...state,
            [e.target.name]: e.target.checked,
        });
    };

    const onSave = (e) => {
        e.preventDefault();

        dispatch({
            type: 'SET_CONFIG',
            payload: {
                config: state,
            },
        });

        Nui.send('SaveConfig', state);

        onClose();
    };

    const getLayoutForm = () => {
        switch (state.layout) {
            case 'minimap':
                return (
                    <Minimap
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                );
            case 'center':
                return (
                    <Center
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                );
            default:
                return null;
        }
    };

    const getStatusForm = () => {
        switch (state.statusType) {
            case 'bars':
                return (
                    <Bars
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                );
            default:
                return null;
        }
    };

    const getVehicleLayoutForm = () => {
        switch (state.vehicle) {
            case 'simple':
                return (
                    <VehicleSimple
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                );
            case 'gauge':
                return (
                    <VehicleSimple
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                ); 
            default:
                return (
                    <VehicleDefault
                        state={state}
                        setState={setState}
                        onChange={onChange}
                        onChecked={onChecked}
                    />
                );
        }
    };

    return (
        <Dialog fullWidth maxWidth="sm" open={isOpen} onClose={onClose}>
            <form onSubmit={onSave}>
                <DialogTitle>HUD Configuration</DialogTitle>
                <DialogContent>
                    <Grid container spacing={2} className={classes.form}>
                        <Grid item xs={12}>
                            <div className={classes.header}>
                                General Settings
                            </div>
                            <Grid container spacing={2}>
                                <Grid item xs={12}>
                                    <TextField
                                        fullWidth
                                        select
                                        className={classes.field}
                                        onChange={onChange}
                                        value={state.layout}
                                        name="layout"
                                        label="Status HUD Layout"
                                        defaultValue="default"
                                    >
                                        {layouts.map((option) => (
                                            <MenuItem
                                                key={option.value}
                                                value={option.value}
                                            >
                                                {option.label}
                                            </MenuItem>
                                        ))}
                                    </TextField>
                                </Grid>
                            </Grid>
                        </Grid>
                        {getLayoutForm()}
                        <Grid item xs={12}>
                            <div className={classes.header}>
                                Status Settings
                            </div>
                            <Grid container spacing={2}>
                                <Grid item xs={12}>
                                    <TextField
                                        fullWidth
                                        select
                                        className={classes.field}
                                        onChange={onChange}
                                        value={state.statusType}
                                        name="statusType"
                                        label="Status Display Type"
                                        defaultValue="numbers"
                                    >
                                        {barTypes.map((option) => (
                                            <MenuItem
                                                key={option.value}
                                                value={option.value}
                                            >
                                                {option.label}
                                            </MenuItem>
                                        ))}
                                    </TextField>
                                </Grid>
                            </Grid>
                        </Grid>
                        {getStatusForm()}
                        <Grid item xs={12}>
                            <div className={classes.header}>
                                Compass Settings
                            </div>
                            <Grid container spacing={2}>
                                <Grid item xs={6}>
                                    <FormControlLabel
                                        control={
                                            <Switch
                                                name="hideCompassBg"
                                                checked={state.hideCompassBg}
                                                onChange={onChecked}
                                            />
                                        }
                                        label="Hide Compass Background"
                                    />
                                </Grid>
                                <Grid item xs={6}>
                                    <FormControlLabel
                                        control={
                                            <Switch
                                                name="hideCrossStreet"
                                                checked={state.hideCrossStreet}
                                                onChange={onChecked}
                                            />
                                        }
                                        label="Hide Cross Street"
                                    />
                                </Grid>
                            </Grid>
                        </Grid>
                        <Grid item xs={12}>
                            <div className={classes.header}>
                                Vehicle Layout Settings
                            </div>
                            <Grid container spacing={2}>
                                <Grid item xs={12}>
                                    <TextField
                                        fullWidth
                                        select
                                        className={classes.field}
                                        onChange={onChange}
                                        value={state.vehicle}
                                        name="vehicle"
                                        label="Vehicle HUD Layout"
                                        defaultValue="numbers"
                                    >
                                        {vehLayouts.map((option) => (
                                            <MenuItem
                                                key={option.value}
                                                value={option.value}
                                            >
                                                {option.label}
                                            </MenuItem>
                                        ))}
                                    </TextField>
                                </Grid>
                            </Grid>
                        </Grid>
                        {getVehicleLayoutForm()}
                        <Grid item xs={12}>
                            <div className={classes.header}>
                                Text Popup Settings
                            </div>
                            <Grid container spacing={2}>
                                <Grid item xs={12}>
                                    <TextField
                                        fullWidth
                                        select
                                        className={classes.field}
                                        onChange={onChange}
                                        value={state.actionStyle}
                                        name="actionStyle"
                                        label="Interaction Popup Style"
                                        defaultValue="legacy"
                                    >
                                        {actionLayouts.map((option) => (
                                            <MenuItem
                                                key={option.value}
                                                value={option.value}
                                            >
                                                {option.label}
                                            </MenuItem>
                                        ))}
                                    </TextField>
                                </Grid>
                            </Grid>
                        </Grid>
                    </Grid>
                </DialogContent>
                <DialogActions>
                    <Button onClick={onClose}>Cancel</Button>
                    <Button type="submit">Save</Button>
                </DialogActions>
            </form>
        </Dialog>
    );
};
