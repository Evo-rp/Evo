import React, { useEffect, useState, useMemo } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { makeStyles, withStyles } from '@mui/styles';
import { Box, Grid, Tab, Tabs, Typography } from '@mui/material';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { throttle } from 'lodash';
import Staff from './components/staff';
import Gang from './components/gang';
import Progression from './components/progression';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        height: '100%',
        background: theme.palette.secondary.main,
        padding: 15,
    },
}));

function TabPanel(props) {
    const { children, value, index, ...other } = props;

    return (
        <div
            role="tabpanel"
            hidden={value !== index}
            id={`simple-tabpanel-${index}`}
            aria-labelledby={`simple-tab-${index}`}
            {...other}
        >
            {value === index && (
                <Box style={{ padding: 1, width: 1585, height: 755 }}>
                    <Typography>{children}</Typography>
                </Box>
            )}
        </div>
    );
}

function a11yProps(index) {
    return {
        id: `simple-tab-${index}`,
        'aria-controls': `simple-tabpanel-${index}`,
    };
}

export default (props) => {
    const classes = useStyles();
    const dispatch = useDispatch();
    const [value, setValue] = useState(0)

    const handleChange = (event, newValue) => {
        setValue(newValue);
    };

    return (
        <div className={classes.wrapper}>
            <Grid container>
                <Box sx={{ borderBottom: 1, borderColor: 'divider', width: '100%' }}>
                    <Tabs value={value} onChange={handleChange} aria-label="basic tabs example">
                        <Tab label="Gang" {...a11yProps(0)} />
                        <Tab label="Progression" {...a11yProps(1)} />
                        <Tab label="Staff" {...a11yProps(2)} />
                    </Tabs>
                </Box>
                <TabPanel value={value} index={0}>
                    <Gang />
                </TabPanel>

                <TabPanel value={value} index={1}>
                    <Progression />
                </TabPanel>

                <TabPanel value={value} index={2}>
                    <Staff />
                </TabPanel>
            </Grid>
        </div>
    );
};
