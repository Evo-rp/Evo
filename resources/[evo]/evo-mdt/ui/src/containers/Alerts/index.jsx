import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { makeStyles } from '@mui/styles';

import { usePermissions } from '../../hooks';
import Notifications from './Notifications';
import Roster from './Roster';
import { ErrorBoundary } from '../../components';
import { IconButton, Tooltip } from '@mui/material';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import Nui from '../../util/Nui';

export default () => {
	const showing = useSelector((state) => state.alerts.showing);
	const alertsMuted = useSelector((state) => state.alerts.alertsMuted)
	const alertsDisplayed = useSelector((state) => state.alerts.alertsDisabled)
	const useStyles = makeStyles((theme) => ({
		container: {
			height: '100%',
			width: '100%',
			maxWidth: 650,
			position: 'fixed',
			top: 0,
			bottom: 0,
			right: 0,
			paddingTop: 20,
			margin: 'auto',
			zIndex: showing ? 1 : -1,
		},
		actions: {
			position: 'fixed',
			backgroundColor: theme.palette.secondary.dark,
			height: 85,
			width: 45,
			top: 20,
			bottom: 0,
			right: 652,
			borderRadius: 2,
			display: showing ? '' : 'none'
		}
	}));
	const dispatch = useDispatch()

	const classes = useStyles();
	const hasPerm = usePermissions();

	if (!hasPerm('police_alerts') && !hasPerm('ems_alerts') && !hasPerm('tow_alerts')) return null;

	return (
		<div className={classes.container}>
			<div
				className={classes.actions}
			>
				<Tooltip
					title={'Mute Alert Sound'}
					placement={'left'}
					arrow
				>
					<IconButton
						onClick={() => {
							dispatch({
								type: 'UPDATE_MUTED_ALERT',
								payload: {
									state: !alertsMuted
								}
							})
							Nui.send('MuteAlertSound', {
								state: !alertsMuted
							})
						}}
					>
						<FontAwesomeIcon
							icon={['fa', alertsMuted ? 'bell-slash' : 'bell']}
							style={{
								color: alertsMuted ? 'red' : 'white',
							}}
						/>
					</IconButton>
				</Tooltip>

				<Tooltip
					title={`${!alertsDisplayed ? `Show` : 'Hide'} Alerts`}
					placement={'left'}
					arrow
				>
					<IconButton
						onClick={() => {
							dispatch({
								type: 'UPDATE_DISPLAYED_ALERTS',
								payload: {
									state: !alertsDisplayed
								}
							})
						}}
					>
						<FontAwesomeIcon
							icon={['fa', alertsDisplayed ? 'eye' : 'eye-slash']}
							style={{
								color: !alertsDisplayed ? 'red' : 'white'
							}}
						/>
					</IconButton>
				</Tooltip>
			</div>

			<Notifications />
			<ErrorBoundary>{showing && <Roster />}</ErrorBoundary>
		</div>
	);
};
