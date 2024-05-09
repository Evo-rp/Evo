import React, { useState } from 'react';
import { ListItem, ListItemText, Grid, ListItemSecondaryAction, IconButton, Tooltip } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { CurrencyFormat } from '../../../../../../util/Parser';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import TestDrive from "../TestDrive";

import Nui from '../../../../../../util/Nui';

import Moment from 'react-moment';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		padding: '20px 10px 20px 20px',
		borderBottom: `1px solid ${theme.palette.border.divider}`,
		'&:first-of-type': {
			borderTop: `1px solid ${theme.palette.border.divider}`,
		},
	},
}));


import { vehicleCategories } from '../data'
import RestockForm from '../RestockForm';

export default ({ vehicle, dealerData, onClick }) => {
	const classes = useStyles();
	const [testDrive, setTestDrive] = useState(false);
	const [restocking, setRestocking] = useState(false);

	const onInternalClick = () => {
		onClick();
	};

	const onTestDrive = (e) => {
		e.stopPropagation();
		setTestDrive(true);
	};

	const onRestock = (e) => {
		e.stopPropagation()
		setRestocking(true)
	}

	const priceMult = 1 + (dealerData?.profitPercentage / 100);
	const salePrice = vehicle?.data?.price * priceMult;

	const startTestDrive = async (data) => {
		setTestDrive(false);
		try {
			let res = await (
				await Nui.send('DealershipStartTestDrive', {
					...data,
					vehicle: vehicle.vehicle,
				})
			).json();

			if (res && res.success) {
				console.log(res?.message ?? 'Vehicle has been delivered for test drive.');
				setTestDrive(false);
			} else {
				console.log(res?.message ?? 'Error Initiating Sale');
			};
			setTestDrive(false);
		} catch (err) {
			console.log(err);
			console.log('Error Initiating Sale');
			setTestDrive(false);
		}
	}

	const restockVehicle = async (data) => {
		setRestocking(false)

		try {
			let res = await (
				await Nui.send('DealershipRestock', {
					...data,
					price: data.price,
					amount: data.amount,
				})
			).json();

			if (res && res.success) {
				setRestocking(false)
			}
		}  catch (err) {
			console.log(err);
			console.log('Error Initiating Sale');
			setRestocking(false);
		}
	}

	return (
		<>
			<ListItem className={classes.wrapper} button onClick={onInternalClick}>
				<Grid container spacing={1}>
					<Grid item xs={3}>
						<ListItemText primary={'Vehicle Make/Model'} secondary={`${vehicle?.data?.make} ${vehicle?.data?.model}`} />
					</Grid>
					<Grid item xs={1}>
						<ListItemText
							primary={'Class'}
							secondary={`${vehicle?.data?.class}`}
						/>
					</Grid>
					<Grid item xs={2}>
						<ListItemText
							primary={'Price'}
							secondary={`${CurrencyFormat.format(Math.ceil(salePrice))} (${CurrencyFormat.format(vehicle?.data?.price)})`}
						/>
					</Grid>
					<Grid item xs={2}>
						<ListItemText
							primary={'Quantity'}
							secondary={`${vehicle?.quantity}`}
						/>
					</Grid>
					<Grid item xs={2}>
						<ListItemText
							primary={'Category'}
							secondary={`${vehicleCategories.find(c => c.value == vehicle?.data?.category)?.label ?? 'Unknown'}`}
						/>
					</Grid>
					<Grid item xs={2}>
						<ListItemText
							primary="Last Purchase"
							secondary={vehicle?.lastPurchase ? <Moment unix date={vehicle?.lastPurchase} fromNow /> : 'Never'}
						/>
						<ListItemSecondaryAction onClick={onTestDrive}>
							<Tooltip
								title='Test Drive'
							>
								<IconButton>
									<FontAwesomeIcon
										icon={['fas', 'magnifying-glass']}
									/>
								</IconButton>
							</Tooltip>
						</ListItemSecondaryAction>

						<ListItemSecondaryAction onClick={onRestock} style={{ marginRight: '4vh' }}>
							<Tooltip
								title='Restock'
							>
								<IconButton>
									<FontAwesomeIcon
										icon={[ 'fa-solid', 'rotate-right' ]}
									/>
								</IconButton>
							</Tooltip>
						</ListItemSecondaryAction>
					</Grid>
				</Grid>
			</ListItem>
			<TestDrive
				open={testDrive}
				vehicle={vehicle}
				onClose={() => setTestDrive(false)}
				onSubmit={startTestDrive}
			/>

			<RestockForm
				open={restocking}
				vehicle={vehicle}
				onClose={() => setRestocking(false)}
				onSubmit={restockVehicle}
			/>
		</>
	);
};
