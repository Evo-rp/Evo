import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Grid, Paper, Button, LinearProgress, Card, CardContent, Typography, CardActions, Box } from '@mui/material';
import { makeStyles, styled } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const useStyles = makeStyles((theme) => ({
    overflowContainer: {
        display: 'flex',
        flexDirection: 'row',
        flexWrap: 'wrap',
        overflow: 'auto',
        height: 650,
        width: 1250,
        marginLeft: 150,
        marginTop: 50
    },
    card: {
        margin: 1,
        textAlign: 'center',
        justifyContent: 'center',
        padding: 2,
        width: 200,
    },
}));

export default () => {
    const classes = useStyles();
    const Gang = useSelector((state) => state.data.data.Gang)

    const ProgressionTypes = [
        {
            Label: 'Sprays Placed',
            TypeKey: 'SPRAYS_PLACED'
        },
        {
            Label: 'Sprays Discovered',
            TypeKey: 'SPRAYS_PLACED'
        },
        {
            Label: 'Sprays Contested',
            TypeKey: 'SPRAYS_PLACED'
        }
    ]

    const CheckExists = (state) => {
        if (Gang.Progression[state]) {
            return Gang.Progression[data.TypeKey]
        } else {
            return '?'
        }
    }

    return (
        <Box className={classes.overflowContainer}>
            {ProgressionTypes.map((data) => {
                return (
                    <Grid item style={{ padding: 5 }}>
                        <Card className={classes.card}>
                            <CardContent>
                                <Typography variant="h4" component="div" style={{ fontSize: 20 }}>
                                    {data.Label}
                                </Typography>
                            </CardContent>
                            <CardActions style={{ display: 'flex', justifyContent: 'center' }}>
                                <Typography variant="h4" component="div" style={{ fontSize: 20 }}>
                                    {CheckExists(data.TypeKey)}
                                </Typography>
                            </CardActions>
                        </Card>
                    </Grid>
                )
            })}
        </Box>
    );
};
