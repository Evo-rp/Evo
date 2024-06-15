import React, { useEffect, useState } from 'react';
import { connect, useDispatch, useSelector } from 'react-redux';
import { Menu, MenuItem, Avatar, Badge, Tooltip } from '@mui/material';
import { makeStyles, withStyles } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
//import NestedMenuItem from 'material-ui-nested-menu-item';

import {
	useAlert,
	useAppView,
	useAppButton,
	useReorder,
	useMyApps,
} from '../../hooks';

const useStyles = makeStyles((theme) => ({
	wrapper: {
		height: '100%',
		userSelect: 'none',
		zIndex: 0,
	},
	grid: {
		display: 'flex',
		flexFlow: 'column',
		height: '90%',
		padding: 10,
		flexWrap: 'wrap',
		justifyContent: 'start',
		alignContent: 'flex-start',
		overflowX: 'hidden',
		overflowY: 'auto',
		'&::-webkit-scrollbar': {
			width: 6,
		},
		'&::-webkit-scrollbar-thumb': {
			background: '#ffffff52',
		},
		'&::-webkit-scrollbar-thumb:hover': {
			background: theme.palette.primary.main,
		},
		'&::-webkit-scrollbar-track': {
			background: 'transparent',
		},
	},
	appBtn: {
		zIndex: 5,
		width: '4rem',
		height: '4rem',
		color: 'white',
		display: 'flex',
		justifyContent: 'center',
		alignItems: 'center',
		borderRadius: '0.6rem',
		margin: '0.636rem',
		transition: '0.25s ease-in-out',
		cursor: 'pointer',
		filter: 'drop-shadow(1px 2px 0px #00000041)'
	},
	appIcon: {
		fontSize: 35,
		width: 60,
		height: 60,
		margin: 'auto',
		color: '#fff',
	},
	appLabel: {
		fontSize: 12,
		overflow: 'hidden',
		textOverflow: 'ellipsis',
		textShadow: '0px 0px 5px #000000',
		fontWeight: 'normal',
		marginTop: 5,
		pointerEvents: 'none',
	},
}));

const NotifCount = withStyles((theme) => ({
	root: {
		width: 24,
		height: 24,
		fontSize: 16,
		lineHeight: '24px',
		color: '#fff',
		background: '#ff0000',
	},
}))(Avatar);

export default (props) => {
	const openedApp = useAppView();
	const classes = useStyles();
	const dispatch = useDispatch();
	const apps = useMyApps();

	const homeApps = useSelector((state) => state.data.data.player?.LaptopApps?.home);

	useEffect(() => {
		dispatch({
			type: 'NOTIF_RESET_APP',
		});
	}, []);

	const onClick = (e, app) => {
		e.preventDefault();

		if (!apps?.[app]?.fake) {
			openedApp(app);
		}
	};

	return (
		<div className={classes.wrapper}>
			<div className={classes.grid}>
				{Object.keys(apps).length > 0
					? homeApps.map((app, i) => {
						let data = apps[app];
						if (data) {
							return (
								<Tooltip
									title={data.label}
									placement='bottom'
								>
									<div
										className={`${classes.appBtn} ${data.fake ? 'fake' : null}`}
										onClick={(e) => {
											console.log('Clicking app')
											onClick(e, app)
										}}
										style={{
											backgroundColor: data.color,
										}}
									>
										<FontAwesomeIcon
											icon={data.icon}
											style={{
												fontSize: '2rem'
											}}
										/>

										{data.unread > 0 ? (
											<Badge
												color="secondary"
												badgeContent={data.unread}
												style={{
													color: 'white',
													position: 'fixed',
													bottom: '30px',
													right: '0.5px',
													fontSize: '15px',
													marginBottom: '20px',
												}}
											/>
										) : (
											<></>
										)}
									</div>
								</Tooltip>
							);
						} else return null;
					})
					: null}
			</div>
		</div>
	);
};
