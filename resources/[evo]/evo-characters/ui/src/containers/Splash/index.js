import React, { useEffect } from 'react';
import { connect } from 'react-redux';
import { makeStyles } from '@mui/styles';

import { login } from '../../actions/loginActions';
import logo from '../../assets/imgs/logo_banner.png';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowPointer, faKeyboard, faSquare } from '@fortawesome/pro-solid-svg-icons';
import Typewriter from "typewriter-effect";

const useStyles = makeStyles((theme) => ({
	wrapper: {
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
		color: theme.palette.text.main,
		zIndex: 1000,
		padding: 36,
	},
	img: {
		maxWidth: 650,
		width: '100%',
	},
	innerBody: {
		lineHeight: '250%',
		transform: 'translate(0%, 50%)',
	},
	splashHeader: {
		fontSize: '2vw',
		display: 'block',
	},
	splashBranding: {
		color: theme.palette.primary.main,
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
	icon: {
		paddingBottom: 2,
		paddingRight: 7,
		color: '#7702e5',
	},
	spaceAfterWord: {
		marginRight: '40px',
	},
	'@keyframes blinker': {
		'50%': {
			opacity: 0.3,
		},
	},
}));

const Splash = (props) => {
	const classes = useStyles();

	const Bleh = (e) => {
		if (e.which == 1 || e.which == 13 || e.which == 32) {
			props.login();
		}
	};

	useEffect(() => {
		['click', 'keydown', 'keyup'].forEach(function (e) {
			window.addEventListener(e, Bleh);
		});

		// returned function will be called on component unmount
		return () => {
			['click', 'keydown', 'keyup'].forEach(function (e) {
				window.removeEventListener(e, Bleh);
			});
		};
	}, []);

	return (
		<div className={classes.wrapper}>
			<img className={classes.img} src={logo} />
			<div className={classes.innerBody}>
				<span className={classes.splashHeader}>
					<Typewriter
						onInit={(typewriter) => {
							typewriter.typeString('Welcome to Evo RP ...').pauseFor(2000).start()
						}}
					/>
				</span>
				<span className={classes.splashTip}>
					<FontAwesomeIcon icon={faKeyboard} className={classes.icon} />
					<span className={classes.splashTipHighlight}>ENTER</span>
					<span className={classes.spaceAfterWord}></span>
					<FontAwesomeIcon icon={faSquare} className={classes.icon} />
					<span className={classes.splashTipHighlight}>SPACE</span>
					<span className={classes.spaceAfterWord}></span>
					<FontAwesomeIcon icon={faArrowPointer} className={classes.icon} />
					<span className={classes.splashTipHighlight}>LEFT MOUSE</span> To Continue
				</span>
			</div>
		</div>
	);
};

const mapStateToProps = (state) => {
	return {
		loading: state.loader.loading,
		message: state.loader.message,
	};
};

export default connect(mapStateToProps, { login })(Splash);