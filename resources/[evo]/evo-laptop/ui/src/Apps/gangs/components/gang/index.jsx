import React from 'react';
import {  useSelector } from 'react-redux';
import { Button, Typography } from '@mui/material';
import { makeStyles } from '@mui/styles';
import Nui from '../../../../util/Nui'

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
                    marginLeft: "4.5%",
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
                    ?
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
                    ?
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
                    onClick={() => Nui.send("Gangs:ToggleSprays")}
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
