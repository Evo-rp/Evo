import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Grid, Paper, Button, LinearProgress, Card, CardContent, Typography, CardActions, Box } from '@mui/material';
import { makeStyles, styled } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const useStyles = makeStyles((theme) => ({
    BoxTextHeader: {
        color: '#fff',
        fontSize: 30,
        fontWeight: 500,
        textAlign: 'center',
        userSelect: 'none'
    },
    BoxText: {
        color: '#8f8f8f',
        userSelect: 'none',
        textAlign: 'center',
        fontSize: 25,
    }
}));

export default () => {
    const classes = useStyles();
    const Gang = useSelector((state) => state.data.data.Gang)

    return (
        <div
            style={{
                marginTop: 50
            }}
        >
            <Typography
                style={{
                    userSelect: 'none',
                    fontSize: 20,
                    color: "white",
                    textAlign: "center",
                }}
            >
                Gang Name
            </Typography>

            <Typography
                style={{
                    userSelect: 'none',
                    fontSize: 30,
                    color: 'white',
                    textAlign: 'center',
                }}
            >
                {Gang.Name}
            </Typography>

            <div
                style={{
                    zIndex: '1',
                    position: 'absolute',
                    marginLeft: "7.5%",
                    marginTop: "6%",
                    transform: "translate(50px, 0px)"
                }}
            >
                <Typography
                    className={classes.BoxTextHeader}
                >
                    Max Members
                </Typography>

                <Typography
                    className={classes.BoxText}
                >
                    15
                </Typography>
            </div>

            <div
                style={{
                    float: 'right',
                    marginRight: "17.5%",
                    marginTop: "6%",
                    transform: "translate(50px, 0px)"
                }}
            >
                <Typography
                    className={classes.BoxTextHeader}
                >
                    Reputation
                </Typography>

                <Typography
                    className={classes.BoxText}
                >
                    15
                </Typography>
            </div>

            <div
                style={{
                    marginTop: "1%",
                    position: "absolute",
                    marginLeft: "37%",
                    transform: "translate(50px, 0px)"
                }}
            >
                <Typography
                    style={{
                        userSelect: 'none',
                        fontSize: 25,
                        color: "white",
                        textAlign: "center",
                        marginTop: "25%",
                    }}
                >
                    Toggle Discovered Graffiti
                </Typography>

                <Button
                    variant="contained"
                    color="success"

                    style={{
                        marginTop: "1%",
                        position: "absolute",
                        marginLeft: "23.5%",
                        transform: "translate(30px, 0px)"
                    }}
                >
                    Toggle
                </Button>
            </div>
        </div>
    );
};
