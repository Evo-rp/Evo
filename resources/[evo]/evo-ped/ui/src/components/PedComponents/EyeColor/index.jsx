import ElementBox from '../../UIComponents/ElementBox/ElementBox';
import React, { useEffect } from 'react';
import { makeStyles } from '@mui/styles';
import { SetPedEyeColor } from '../../../actions/pedActions';
import { Ticker } from '../../UIComponents';
import Nui from '../../../util/Nui';
import { connect, useSelector } from 'react-redux';

const useStyles = makeStyles((theme) => ({
	body: {
		maxHeight: '100%',
		overflowX: 'hidden',
		overflowY: 'auto',
		margin: 0,
		justifyContent: 'space-around',
	},
}));

const EyeColors = [
	'Black',
	'Light Blue/Green',
	'Dark Blue',
	'Brown',
	'Dark Brown',
	'Light Brown',
	'Blue',
	'Light Blue',
	'Pink',
	'Yellow',
	'Purple',
	'Black',
	'Dark Green',
	'Light Brown',
	'Yellow/Black Pattern',
	'Light Spiral',
	'Chromatic Red',
	'Chromatic Red/Blue',
	'Black & Blue',
	'Red & White',
	'Green Snake',
	'Red Snake',
	'Dark Blue Snake',
	'Dark Yellow',
	'Bright Yellow',
	'Solid Black',
	'Blue & Black Devil',
	'Small White Pupil',
	'Glossed Over',
];

export default connect()((props) => {
	const classes = useStyles();

	return (
		<ElementBox label={props.label} bodyClass={classes.body}>
			<Ticker
				label={props.label}
				event={SetPedEyeColor}
				data={{
					type: 'drawableId',
					name: props.name,
				}}
				current={props.component}
				min={0}
				max={EyeColors.length - 1}
				disabled={props.disabled}
			/>
		</ElementBox>
	);
});
