import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Tab, Tabs, ButtonGroup, Button, Tooltip } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { TabPanel, Dialog } from '../../components/UIComponents';
import { CurrencyFormat } from '../../util/Parser';
import { SavePed, CancelEdits } from '../../actions/pedActions';
import Hair from '../../components/Hair/Hair';
import FaceMakeup from '../../components/Face/FaceMakeup/FaceMakeup';
import Wrapper from '../../components/UIComponents/Wrapper/Wrapper';
import Naked from '../../components/PedComponents/Naked';
import Nui from '../../util/Nui';

const useStyles = makeStyles((theme) => ({
	headerContainer: {
		backgroundColor: '#141414',
		height: 60,
		width: '100%'
	},
	save: {
		position: 'absolute',
		right: 10,
		top: 10,
		transition: 'filter ease-in 0.15s',
		'& svg': {
			marginLeft: 6,
		},
		'&:hover': {
			filter: 'brightness(0.7)',
		},
	},
	camBar: {
		position: 'absolute',
		background: theme.palette.secondary.dark,
		width: 'fit-content',
		height: 'fit-content',
		right: 590
	},
	btnBar: {
		position: 'absolute',
		right: 0,
		background: theme.palette.secondary.dark,
		width: 'fit-content',
		height: '100vh',
	},
	panel: {
		width: 500,
		position: 'absolute',
		right: 90,
		top: 0,
		height: 'calc(104.5vh - 48px)',
	},
}));

export default (props) => {
	const classes = useStyles();
	const dispatch = useDispatch();
	const camera = useSelector((state) => state.app.camera);
	const state = useSelector((state) => state.app.state);
	const cost = useSelector((state) => state.app.pricing.BARBER);

	const [cancelling, setCancelling] = useState(false);
	const [saving, setSaving] = useState(false);
	const [value, setValue] = useState(0);

	const handleChange = (event, newValue) => {
		setValue(newValue);
	};

	const onCamChange = async (e, newValue) => {
		try {
			let res = await (await Nui.send('ChangeCamera', newValue)).json();

			if (res) {
				dispatch({
					type: 'SET_CAM',
					payload: {
						cam: newValue,
					},
				});
			}
		} catch (err) {}
	};

	const onCancel = () => {
		setCancelling(false);
		dispatch(CancelEdits());
	};

	const onSave = () => {
		setSaving(false);
		dispatch(SavePed(state));
	};

	return (
		<div>
			<div className={classes.camBar}>
				<Tabs
					orientation='vertical'
					style={{
						height: '100%',
					}}
					value={camera}
					onChange={onCamChange}
					indicatorColor="primary"
					textColor="primary"
				>
					<Tooltip
						title={'Zoomed Out Camera'}
						placement={'left'}
						arrow
					>
						<Tab
							label={
								<FontAwesomeIcon icon={['fas', 'person']} />
							}
						/>
					</Tooltip>

					<Tooltip
						title={'Face Camera'}
						placement={'left'}
						arrow
					>
						<Tab
							label={<FontAwesomeIcon icon={['fas', 'face-smile']} />}
						/>
					</Tooltip>

					<Tooltip
						title={'Body Camera'}
						placement={'left'}
						arrow
					>
						<Tab
							label={
								<FontAwesomeIcon icon={['fas', 'shirt']} />
							}
						/>
					</Tooltip>

					<Tooltip
						title={'Shoe Camera'}
						placement={'left'}
						arrow
					>
						<Tab label={<FontAwesomeIcon icon={['fas', 'shoe-prints']} />} />
					</Tooltip>
				</Tabs>
			</div>
			<div className={classes.btnBar}>
				<Tabs
					orientation="vertical"
					style={{ height: '100%' }}
					value={value}
					onChange={handleChange}
					indicatorColor="primary"
					textColor="primary"
					variant="scrollable"
				>
					<Tooltip
						title={'Hair Customisation'}
						placement={'left'}
						arrow
					>
						<Tab
							label={<FontAwesomeIcon icon={['fas', 'scissors']} />}
						/>
					</Tooltip>

					<Tooltip
						title={'Makeup Customisation'}
						placement={'left'}
						arrow
					>
						<Tab label={<FontAwesomeIcon icon={['fas', 'paintbrush']} />} />
					</Tooltip>
				</Tabs>
			</div>
			<div className={classes.panel} id="noHover">
				<div
					className={classes.headerContainer}
				>
					<Naked />
					<ButtonGroup variant="contained" className={classes.save}>
						<Button color="error" onClick={() => setCancelling(true)}>
							Cancel
							<FontAwesomeIcon icon={['fas', 'x']} />
						</Button>
						<Button color="success" onClick={() => setSaving(true)}>
							Save
							<FontAwesomeIcon icon={['fas', 'save']} />
						</Button>
					</ButtonGroup>
				</div>

				<TabPanel value={value} index={0}>
					<Hair />
				</TabPanel>
				<TabPanel value={value} index={1}>
					<Wrapper>
						<FaceMakeup />
					</Wrapper>
				</TabPanel>
			</div>

			<Dialog
				title="Cancel?"
				open={cancelling}
				onAccept={onCancel}
				onDecline={() => setCancelling(false)}
				acceptLang="Yes"
				declineLang="No"
			>
				<p>
					All changes will be discarded, are you sure you want to
					continue?
				</p>
			</Dialog>
			<Dialog
				title="Save Haircut?"
				open={saving}
				onAccept={onSave}
				onDecline={() => setSaving(false)}
			>
				<p>
					You will be charged{' '}
					<span className={classes.highlight}>
						{CurrencyFormat.format(cost)}
					</span>
					?
				</p>
				<p>Are you sure you want to save?</p>
			</Dialog>
		</div>
	);
};
