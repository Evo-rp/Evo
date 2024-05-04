import React from 'react';
import { useSelector } from 'react-redux';
import { makeStyles } from '@material-ui/styles';
import { Fade, Grid } from '@material-ui/core';

import { CurrencyFormat } from '../../util/Parser';

const useStyles = makeStyles((theme) => ({
	taxiMeter: {
		position: 'absolute',
		bottom: -30,
		right: -80,
	},
	wrapper: {
		height: 'fit-content',
		width: 500,
		color: theme.palette.text.main,
		// border: `1px solid ${theme.palette.border.input}`,
		fontWeight: 'bold',
		fontSize: 32,
		position: 'absolute',
		bottom: 0,
		right: 0,
		margin: 'auto',
		fontFamily: 'LCD',
	},
	block: {
		// background: '#000',
		padding: 10,
		borderRight: `1px solid #1e1e1e`,
	},
	blockHeader: {
		fontSize: 25,
		color: theme.palette.text.alt,
	},
	blockContent: {
		textAlign: 'right',
		fontSize: 50,
		padding: 5,
	},
	smallBlockHeader: {
		fontSize: 16,
		color: theme.palette.text.alt,
	},
	smallBlockContent: {
		textAlign: 'right',
		fontSize: 28,
		padding: 5,
		'& small': {
			color: theme.palette.text.alt,
			fontSie: 14,
			marginLeft: 5,
		},
	},
}));

export default () => {
	const classes = useStyles();
	const rate = useSelector((state) => state.app.rate);
	const trip = useSelector((state) => state.app.trip);

	return (
		<>
			<img className={classes.taxiMeter} src={'https://cdn.discordapp.com/attachments/1232668415429312603/1236372207060520960/image.png?ex=6637c4d8&is=66367358&hm=fe0b30c639d10f0e4aeb006dd97818e4b86791f7038f6625c3d2699faa219709&'} />
			<div container className={classes.wrapper}>
				<div className={classes.block}>
					<div className={classes.blockHeader} style={{ position: 'absolute', right: 25, bottom: 115 }}>FARE</div>
					<div className={classes.blockContent} style={{ position: 'absolute', bottom: 120, right: 120 }}>
						{CurrencyFormat.format(Math.ceil((trip / 1609) * rate))}
					</div>
				</div>
				<div className={classes.block}>
					<div className={classes.blockContent} style={{ position: 'absolute', right: 65, bottom: 25 }}>
						{(trip / 1609).toFixed(3)}
					</div>
					<div className={classes.blockHeader} style={{ position: 'absolute', right: 20, bottom: 25 }}>TRIP</div>
				</div>	
				<div className={classes.block}>
					<div className={classes.smallBlockHeader} style={{ position: 'absolute', right: 240, bottom: 25 }}>RATE</div>
					<div className={classes.smallBlockContent} style={{ position: 'absolute', right: 300, bottom: 40 }}>
						{CurrencyFormat.format(rate)}
					</div>
				</div>
			</div>
		</>
	);
};
