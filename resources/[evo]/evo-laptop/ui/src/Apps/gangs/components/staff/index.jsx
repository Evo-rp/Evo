import React, { useState } from 'react';
import { useSelector } from 'react-redux';
import { Grid, Paper, Button, Card, CardContent, Typography, CardActions, Box, Dialog, DialogTitle, DialogContent, DialogActions, TextField, InputAdornment } from '@mui/material';
import { Modal } from "../../../../components";
import { makeStyles, styled } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import Nui from '../../../../util/Nui'

const useStyles = makeStyles((theme) => ({
	wrapper: {
		background: theme.palette.secondary.dark,
		margin: '0 auto',
		width: '100%',
		height: '90%',
		display: 'flex',
		marginLeft: 275
	},
	details: {
		display: 'flex',
		justifyContent: 'center',
		width: '100%',
		height: 'fit-content',
		top: 10,
		bottom: 0,
		margin: 'auto',
	},
	title: {
		fontSize: 20,
		color: '#fff',
		fontWeight: 'bold',
		display: 'flex',
		marginTop: 25,
		'& svg': {
			marginRight: 6,
			color: 'gold',
		},
	},
	overflowContainer: {
		display: 'flex',
		flexDirection: 'row',
		flexWrap: 'wrap',
		overflow: 'auto',
		maxHeight: 750,
		marginTop: 10
	},
	card: {
		margin: 1,
		textAlign: 'center',
		justifyContent: 'center',
		padding: 2,
		width: 300,
	},
	circle: {
		display: 'flex',
		justifyContent: 'center',
		alignItems: 'center',
		width: '60px',
		height: '60px',
		borderRadius: '50%',
		backgroundColor: 'gray',
		color: theme.palette.primary.contrastText,
		marginBottom: theme.spacing(2),
		fontSize: '1.5rem',
		marginLeft: 95
	},
	popup: {
		paddingTop: `5px !important`,
		maxHeight: `750px !important`,
	},
}));

export default () => {
	const classes = useStyles();

	const [showingAdd, setShowingAdd] = useState(false)
	const [addInput, setAddInput] = useState('')

	const [kickingMember, setKickingMember] = useState(false)
	const [memberKickData, setMemberKickData] = useState({
		Name: '',
		SID: 0,
	})

	const Gang = useSelector((state) => state.data.data.Gang)
	const Player = useSelector((state) => state.data.data.player)

	const isGangLeader = () => {
		if (Gang.LeadersSid.includes(Player.SID)) {
			return true
		} else {
			return false
		}
	}

	return (
		<>
			<Grid item xs={12} style={{ position: 'relative', height: 38 }}>
				<div className={classes.details}>
					<div className={classes.title}>
						Members ({Gang.Members.length})
					</div>
				</div>
			</Grid>
			<Grid item xs={12} style={{ position: 'relative', height: 38 }}>
				<div className={classes.details}>
					<div className={classes.title}>
						<Button
							variant='contained'
							color={isGangLeader() ? 'success' : 'error'}
							onClick={async() => {
								if (isGangLeader()) {
									setShowingAdd(true)
								} else {
									await (await Nui.send("Gangs:LeaveGang", {})).json();
								}
							}}
						>
							{isGangLeader() ? 'Add Member' : 'Leave Gang'}
						</Button>
					</div>
				</div>
			</Grid>

			<Box className={classes.overflowContainer}>
				{Gang.Members.map((data) => {
					return (
						<Grid item style={{ padding: 5 }}>
							<Card className={classes.card}>
								<CardContent>
									<div className={classes.circle}>{data.SID}</div>
									<Typography variant="h4" component="div" style={{ fontSize: 20 }}>
										{data.Name}
									</Typography>
								</CardContent>

								{Gang.LeadersSid.includes(Player.SID) &&
									<CardActions>
										<Button
											fullWidth
											variant="contained"
											color="error"
											size="large"
											onClick={() => {
												setMemberKickData({
													Name: data.Name,
													SID: data.SID
												})
												setKickingMember(true)
											}}
										>
											Kick Member
										</Button>
									</CardActions>
								}
							</Card>
						</Grid>
					)
				})}
			</Box>

			<Dialog
				scroll="paper"
				open={showingAdd}
				onClose={() => {
					setAddInput('')
					setShowingAdd(false)
				}}
			>
				<DialogTitle
					style={{ cursor: 'move' }}
					id="draggable-dialog-title"
				>
					Add Member
				</DialogTitle>
				<DialogContent className={classes.popup}>
					<TextField
						placeholder='State ID'
						variant='standard'
						type='number'
						name='sid'
						value={addInput}
						fullWidth
						onChange={(e) => {
							setAddInput(e.target.value)
						}}
						InputProps={{
							startAdornment: (
								<InputAdornment position="start">
									<FontAwesomeIcon
										icon={['fas', 'id-badge']}
									/>
								</InputAdornment>
							),
						}}
					/>
				</DialogContent>
				<DialogActions>
					<Button
						fullWidth
						variant='contained'
						type="submit"
						color={'success'}
						onClick={async () => {
							setShowingAdd(false)
							await (await Nui.send("Gangs:AddMember", { SID: addInput })).json();
							setAddInput('')
						}}
					>
						Add
					</Button>
				</DialogActions>
			</Dialog>

			<Modal
				open={kickingMember}
				title={'Kicking Member'}
				onClose={() => setKickingMember(false)}
				onAccept={() => {
					console.log(memberKickData.SID)
					Nui.send("Gangs:KickMember", { SID: memberKickData.SID })
					setKickingMember(false)
				}}
				acceptLang={`Kick`}
				closeLang={"Cancel"}
			>
				<p>Are you sure you want to kick {memberKickData.Name}</p>
			</Modal>
		</>
	);
};
