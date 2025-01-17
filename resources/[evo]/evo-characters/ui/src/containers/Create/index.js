/* eslint-disable react/prop-types */
import React, { useState } from 'react';
import { connect } from 'react-redux';
import { TextField, FormControl, MenuItem, Autocomplete, Paper, Typography, Grid, Stack, Button } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { LocalizationProvider, DatePicker } from '@mui/x-date-pickers';
import { getCodeList } from 'country-list';
import { AdapterMoment } from '@mui/x-date-pickers/AdapterMoment';
import moment from 'moment';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { SET_STATE } from '../../actions/types';
import { createCharacter } from '../../actions/characterActions';
import { STATE_CHARACTERS } from '../../util/States';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		width: 630,
		height: 450,
		position: 'absolute',
		top: 0,
		bottom: 0,
		right: 0,
		left: 0,
		margin: 'auto',
		background: theme.palette.secondary.main,
	},
	createForm: { margin: 25 },
	button: {
		fontSize: 14,
		lineHeight: '20px',
		fontWeight: '500',
		display: 'inline-block',
		padding: '10px 20px',
		borderRadius: 3,
		userSelect: 'none',
		margin: 10,
		width: '40%',
		'&:disabled': {
			opacity: 0.5,
			cursor: 'not-allowed'
		}
	},
	positive: {
		border: `2px solid ${theme.palette.success.dark}`,
		background: theme.palette.success.main,
		color: theme.palette.text.dark,
		fontSize: 20,
		padding: 10,
		width: 105,
		textAlign: 'center',
		transition: 'filter ease-in 0.15s',
		'&:hover': {
			background: theme.palette.success.main,
			filter: 'brightness(0.7)'
		}
	},
	negative: {
		border: `2px solid ${theme.palette.error.dark}`,
		background: theme.palette.error.main,
		color: theme.palette.text.main,
		fontSize: 20,
		padding: 10,
		width: 105,
		textAlign: 'center',
		transition: 'filter ease-in 0.15s',
		'&:hover': {
			background: theme.palette.error.main,
			filter: 'brightness(0.7)'
		}
	},
	form: {
		display: 'flex',
		justifyContent: 'space-evenly',
		padding: '1% 0',
		flexWrap: 'wrap'
	},
	formControl: {
		width: '45%',
		display: 'block',
		margin: 10
	},
	formControlFull: {
		width: '94%',
		display: 'block',
		margin: 10
	},
	formControl2: {
		width: '94%',
		display: 'block',
		margin: 10
	},
	input: { width: '100%' },
	header: {
		color: theme.palette.text.main,
		position: 'absolute',
		top: 20,
		left: 42.5,
		letterSpacing: 1,
		textTransform: 'uppercase',
		whiteSpace: 'nowrap'
	}
}));

const genders = [
	{
		value: 0,
		label: 'Male',
	},
	{
		value: 1,
		label: 'Female',
	},
];

const countriesOrigin = getCodeList();
const date = new Date();
date.setFullYear(date.getFullYear() - 18);
const date2 = new Date();
date2.setFullYear(date2.getFullYear() - 100);

const Create = (props) => {
	const classes = useStyles();

	const countries = Object.keys(countriesOrigin).map((k) => {
		let c = countriesOrigin[k];
		return {
			label: c,
			value: k,
		};
	});

	const [state, setState] = useState({
		first: '',
		last: '',
		dob: new Date('1990-12-31T23:59:59'),
		gender: 0,
		bio: '',
		origin: null,
		originInput: '',
	});

	const onChange = (evt) => {
		if (evt.target.name == 'first' || evt.target.name == 'last') {
			setState({
				...state,
				[evt.target.name]: evt.target.value.replace(/\s/g, ''),
			});
		} else {
			setState({
				...state,
				[evt.target.name]: evt.target.value,
			});
		}
	};

	const onSubmit = (evt) => {
		evt.preventDefault();

		const data = {
			first: state.first,
			last: state.last,
			gender: state.gender,
			dob: moment(state.dob).unix(),
			lastPlayed: -1,
			origin: state.origin,
		};
		props.createCharacter(data, props.dispatch);
	};

	return (
		<LocalizationProvider dateAdapter={AdapterMoment}>
			<div className={classes.wrapper}>
				<div className={classes.createForm}>
					<div
						className={classes.header}
					>
						<Typography
							sx={{
								textAlign: 'center',
								fontWeight: 400,
								fontSize: 20
							}}
						>
							Create Character
						</Typography>
					</div>
					<form
						autoComplete="off"
						id="createForm"
						className={classes.form}
						onSubmit={onSubmit}
					>
						<Typography
							className={classes.formControlFull}
							variant={'h5'}
							sx={{ textTransform: 'uppercase', paddingTop: 2 }}
							fontWeight={'bold'}
							gutterBottom={true}
						>
							Welcome To Los Santos
						</Typography>

						<FormControl className={classes.formControl}>
							<TextField
								className={classes.input}
								required
								label="First Name"
								name="first"
								variant="outlined"
								value={state.first}
								onChange={onChange}
							/>
						</FormControl>
						<FormControl className={classes.formControl}>
							<TextField
								className={classes.input}
								required
								label="Last Name"
								name="last"
								variant="outlined"
								value={state.last}
								onChange={onChange}
							/>
						</FormControl>
						<FormControl className={classes.formControlFull}>
							<Autocomplete
								value={state.origin}
								onChange={(e, v) => {
									onChange({
										target: {
											name: 'origin',
											value: v,
										},
									});
								}}
								inputValue={state.originInput}
								onInputChange={(e, v) => {
									onChange({
										target: {
											name: 'originInput',
											value: v,
										},
									});
								}}
								options={countries}
								getOptionLabel={(option) =>
									Boolean(option) ? option.label : ''
								}
								renderInput={(params) => (
									<TextField
										{...params}
										label="Country of Origin"
										variant="outlined"
									/>
								)}
							/>
						</FormControl>
						<FormControl className={classes.formControl}>
							<TextField
								className={classes.input}
								required
								select
								label="Gender"
								name="gender"
								value={state.gender}
								onChange={onChange}
								variant="outlined"
							>
								{genders.map((option) => (
									<MenuItem
										key={option.value}
										value={option.value}
									>
										{option.label}
									</MenuItem>
								))}
							</TextField>
						</FormControl>
						<FormControl className={classes.formControl}>
							<DatePicker
								className={classes.input}
								openTo="year"
								autoOk
								animateYearScrolling
								disableFuture
								required
								label="Date of Birth"
								views={['year', 'month', 'day']}
								value={state.dob}
								onChange={(newDate) =>
									onChange({
										target: { name: 'dob', value: newDate },
									})
								}
								renderInput={(params) => (
									<TextField fullWidth {...params} />
								)}
							/>
						</FormControl>
					</form>
				</div>

				<Grid
					container={true}
					spacing={0}
					direction={'column'}
					alignItems={'center'}
					justifyContent={'center'}
					sx={{
						position: 'absolute',
						bottom: 0,
						backgroundColor: 'rgba(217, 217, 217, 0.05)'
					}}
				>
					<Stack
						sx={{ padding: 2 }}
						direction={'row'}
						spacing={2}
					>
						<Button
							variant="contained"
							startIcon={<FontAwesomeIcon icon={['fas', 'circle-check']} />}
							color="success"
							square={true}
							type="submit"
							form="createForm"
						>
							Create Character
						</Button>

						<Button
							variant="text"
							startIcon={<FontAwesomeIcon icon={['fas', 'circle-xmark']} />}
							sx={{
								textDecoration: 'underline !important',
								textUnderlineOffset: 5,
								color: 'white'
							}}
							square={true}
							onClick={() => {
								props.dispatch({
									type: SET_STATE,
									payload: { state: STATE_CHARACTERS },
								});
							}}
						>
							Cancel
						</Button>
					</Stack>
				</Grid>
			</div>
		</LocalizationProvider>
	);
};

const mapDispatchToProps = (dispatch) => ({
	dispatch,
	createCharacter,
});

export default connect(null, mapDispatchToProps)(Create);
