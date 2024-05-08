import React from 'react';
import { CircularProgress } from '@material-ui/core';
import { makeStyles } from '@material-ui/styles';
import { Dot } from 'react-animated-dots';
import Typewriter from "typewriter-effect";

const useStyles = makeStyles((theme) => ({
	wrapper: {
		// height: '100%',
		// width: '55%',
		// position: 'absolute',
		// top: 0,
		// bottom: 0,
		// left: 0,
		// right: 0,
		// margin: 'auto',
		// textAlign: 'center',
		// justifyContent: 'center',
		// fontSize: 30,
		// color: "#ffffff",
		// zIndex: 1000,
		// padding: 36,
		// display: 'flex',
		// flexDirection: 'column',
		// justifyContent: 'flex-end',

		height: 'fit-content',
		width: '55%',
		position: 'absolute',
		top: 0,
		bottom: 0,
		left: 0,
		right: 0,
		margin: 'auto',
		textAlign: 'center',
		fontSize: 30,
		color: '#ffffff',
		zIndex: 1000,
		padding: 36,	
	},
	img: {
		maxWidth: 500,
		width: '100%',
	},
	innerBody: {
		marginBottom: '100px',
		lineHeight: '250%',
		transform: 'translate(0%, 50%)',
		width: '100%',
	},
	splashHeader: {
		fontSize: '2vw',
		display: 'block',
	},
	splashBranding: {
		color: '#7702e5',
	},
	splashTip: {
		fontSize: '1vw',
		animation: '$blinker 1s linear infinite',
	},
	splashTipHighlight: {
		fontWeight: 500,
		color: '#7702e5',
		opacity: 1,
	},
	dot1: {
		color: '#7702e5',
	},
	dot2: {
		color: '#ffffff',
	},
	dot3: {
		color: '#7702e5',
	},
	'@keyframes blinker': {
		'50%': {
			opacity: 0.3,
		},
	},
}));

export default (props) => {
	const classes = useStyles();

	return (
		<div className={classes.wrapper}>
			<div className={classes.innerBody}>
				<span className={classes.splashHeader}>
					<Typewriter
						onInit={(typewriter) => {
							typewriter.typeString(props.name + ', Welcome to Evo RP')
							.pauseFor(3000)
							.deleteAll()
							.typeString("You are loading into the server ...")
							.pauseFor(2000)
							.deleteAll()
							.typeString("We 👂 your feedback 💬")
							.pauseFor(2000)
							.deleteAll()
							.typeString("BING 💥 BONG")
							.pauseFor(2000)
							.deleteAll()
							.typeString("STREETK 🔫 ")
							.pauseFor(2000)
							.deleteAll()
							.typeString("Ak 40 to yo liva 🤭 ")
							.pauseFor(2000)
							.start()
						}}
					/>
				</span>
				<span className={classes.splashTip}>
					{`Loading Into Server `}
					<Dot className={classes.dot1}>.</Dot>
					<Dot className={classes.dot2}>.</Dot>
					<Dot className={classes.dot3}>.</Dot>
				</span>
			</div>
		</div>
	);
};
