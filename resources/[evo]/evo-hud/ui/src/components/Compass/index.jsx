import React from 'react';
import { makeStyles } from '@mui/styles';
import { useSelector } from 'react-redux';
import {
    Fade,
} from '@mui/material';

const useStyles = makeStyles((theme) => ({
    wrapper: {
        position: "absolute",
        width: "100%",
        height: "100%",

        display: "flex",
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "flex-start",
    },
    pointer: {
        width: '2vh',
        height: '2vh',
        position: 'absolute',
        margin: '0 auto',
        left: 0,
        right: 0,
        top: 0,
        marginTop: '0.2vh',
        color: 'rgb(255, 255, 255)',
        fontSize: '2.2vh',
        textAlign: 'center',
    },
    baseplate: {
        position: 'relative',
        margin: '0 auto',
        width: '13.5vh',
        height: '100%',

        marginBottom: '-8vh',

        transform: 'scale(1.2)'
    },
    bezel: {
        position: 'relative',
        width: '100%',
        height: '4vh',
        fontSize: '0.35vh',
    },
    bearing: {
        position: 'relative',
        width: '100%',
        top: '-0.5vh',
        height: '3.5vh',
        paddingLeft: '0.12vw',
        fontFamily: "Oswald",
        fontSize: '42.5px',
        letterSpacing: '0.7px',
    }
}));

export default () => {
    const classes = useStyles();
    const isShowing = useSelector((state) => state.Compass.showing);
    const Location = useSelector((state) => state.Compass.location);

    return (
        <Fade
            in={isShowing}
            timeout={500}
        >
            <div>
                <div className={classes.wrapper}>
                    <svg style={{
                        width: "100%",
                        height: "100%",
                    }} viewBox="-180 0 360 40" preserveAspectRatio="xMinYMin meet" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <text style={{ fontFamily: 'Oswald', fontSize: "4.5px", paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "1px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="-20" y="8" dominantBaseline="middle" textAnchor="end" fill="white">{Location.main}</text>
                        <text style={{ fontFamily: 'Oswald', fontSize: "4.5px", paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "1px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="20" y="8" dominantBaseline="middle" textAnchor="start" fill="white">{Location.cross} [{Location.area}]</text>
                    </svg>
                </div>

                <svg className={classes.pointer} viewBox="0 0 17 35" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.5 34L2.00481 1H14.9952L8.5 34Z" fill="white" />
                    <path d="M2.00481 0.5H1.3968L1.51422 1.09656L8.00941 34.0966H8.99059L15.4858 1.09656L15.6032 0.5H14.9952H2.00481Z" stroke="black" strokeOpacity="0.2" />
                </svg>

                <div className={classes.baseplate}>
                    <svg className={classes.bezel} viewBox={`${Location.heading - 90} 0 180 5`}>
                        <svg x="-90" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="-45" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="0" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="45" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="90" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="135" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="180" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="225" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="270" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="315" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="360" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="405" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                        <svg x="450" width="2" height="20.5" viewBox="0 0 2 10.5" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect x="1" y="1" width="2" height="19" fill="white" />
                            <rect x="0.5" y="0.5" width="3" height="20" stroke="black" stroke-opacity="0.2" />
                        </svg>
                    </svg>

                    <svg className={classes.bearing} preserveAspectRatio="xMinYMin meet" viewBox={`${Location.heading - 90} 0 180 1.5`}>
                        <text style={{ paintOrder: "stroke", fontFamily: 'Oswald', strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="0" y="25.5" dominantBaseline="middle" textAnchor="middle">N</text>
                        <text style={{ paintOrder: "stroke", fontFamily: 'Oswald', strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="360" y="25.5" dominant-baseline="middle" text-anchor="middle">N</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="315" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">NW</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="-45" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">NW</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="45" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">NE</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="405" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">NE</text>
                        <text style={{ paintOrder: "stroke", fontFamily: 'Oswald', strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="90" y="25.5" dominant-baseline="middle" text-anchor="middle" fill="white">E</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="135" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">SE</text>
                        <text style={{ paintOrder: "stroke", fontFamily: 'Oswald', strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="180" y="25.5" dominant-baseline="middle" text-anchor="middle" fill="white">S</text>
                        <text style={{ fontSize: "22px", fontFamily: 'Oswald', paintOrder: "stroke", strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="225" y="22.5" dominant-baseline="top" text-anchor="middle" fill="white">SW</text>
                        <text style={{ paintOrder: "stroke", fontFamily: 'Oswald', strokeLinejoin: "round", strokeWidth: "6px", stroke: "rgba(0, 0, 0, 0.2)", fill: "white" }} x="270" y="25.5" dominant-baseline="middle" text-anchor="middle" fill="white">W</text>
                    </svg>
                </div>
            </div>
        </Fade>
    );
};
