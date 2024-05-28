import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Grid, Paper, Button, LinearProgress, Card, CardContent, Typography, CardActions, Box } from '@mui/material';
import { makeStyles, styled } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
// import { useAlert } from '../../../hooks';

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
	}
}));

export default () => {
	const classes = useStyles();
	const Gang = useSelector((state) => state.data.data.Gang)

	return (
		<>
			<Grid item xs={12} style={{ position: 'relative', height: 38 }}>
				<div className={classes.details}>
					<div className={classes.title}>
						Members ({Gang.Members.length})
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
								<CardActions>
									<Button fullWidth variant="contained" color="error" size="large">
										Kick Member
									</Button>
								</CardActions>
							</Card>
						</Grid>
					)
				})}
			</Box>
		</>
	);
};
