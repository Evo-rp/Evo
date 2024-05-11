import React, { useEffect, useState } from 'react';
import { makeStyles } from '@mui/styles';
import { Modal } from '../../../../../components';
import { InputAdornment, TextField } from '@mui/material';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { CurrencyFormat } from '../../../../../util/Parser';

const useStyles = makeStyles((theme) => ({
	editorField: {
		marginBottom: 10,
	},
}));

export default ({ open, vehicle, onSubmit, onClose }) => {
	const classes = useStyles();

	const initialState = {
		type: 'restock',
        price: vehicle?.data?.price,
        vehicle: vehicle,
        amount: 1,
	}

    const [state, setState] = useState({
		...initialState,
	});

	const internalSubmit = (e) => {
		e.preventDefault();
		onSubmit(state);
		setState({ ...initialState });
	};

	const onChange = (e) => {
		setState({
			...state,
			amount: Number(e.target.value),
			price: e.target.value,
		});
	};

	return (
		<Modal
			open={open}
			maxWidth="md"
			title={`Restock: ${vehicle?.data?.make} ${vehicle?.data?.model}`}
			submitLang="Confirm"
			onSubmit={internalSubmit}
			onClose={onClose}
		>
			<p>Vehicle: {`${vehicle?.data?.make} ${vehicle?.data?.model}`}</p>

            <TextField
                placeholder='Amount'
                type='number'
                name='amount'
                value={state.amount}
                fullWidth
                onChange={onChange}
                InputProps={{
                    startAdornment: (
                        <InputAdornment position="start">
                            <FontAwesomeIcon
                                icon={['fas', 'car']}
                            />
                        </InputAdornment>
                    ),
                }}
            />

            <p>Price: {CurrencyFormat.format(Math.ceil(vehicle?.data?.price * state.amount / 4) * 3)}</p>
		</Modal>
	);
};
