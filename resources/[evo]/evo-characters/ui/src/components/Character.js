/* eslint-disable react/prop-types */
import React, { useEffect, useState } from 'react';
import { connect, useDispatch, useSelector } from 'react-redux';
import Moment from 'react-moment';
import { List, ListItem, Collapse, ListItemText, Paper, Card, CardContent, Typography, Button, CardActions, Zoom } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { getCharacterSpawns, showCreator } from '../actions/characterActions';
import CalendarMonthIcon from '@mui/icons-material/CalendarMonth';
import AccessTimeIcon from '@mui/icons-material/AccessTime';

const useStyles = makeStyles((theme) => ({
	highlight: {
		color: theme.palette.primary.main,
	},
}));

const Character = (props) => {
	const classes = useStyles();
	const selected = useSelector((state) => state.characters.selected);
	const state = useSelector((state) => state.characters);

	const [windowWidth, setWindowWidth] = useState(window.innerWidth);
	const [windowHeight, setWindowHeight] = useState(window.innerHeight);

	useEffect(() => {
		const handleResize = () => {
			setWindowWidth(window.innerWidth);
			setWindowHeight(window.innerHeight);
		};

		window.addEventListener('resize', handleResize);

		return () => {
			window.removeEventListener('resize', handleResize);
		};
	}, []);

	return (
		<Zoom
			in={selected !== null}
			timeout={500}
		>
			<Card
				style={{
					backgroundColor: '#000',
					position: 'absolute',
					left: state.position.x * windowWidth - 125,
					top: state.position.y * windowHeight - 220,
					width: 250,
				}}
			>
				<CardContent>
					<Typography
						textAlign={'center'}
						variant={'h5'}
						component={'div'}
					>
						{state.characters[state.characterIndex] ?
							`${state.characters[state.characterIndex].First} ${state.characters[state.characterIndex].Last}` :
							'New Character'
						}
					</Typography>

					{state.characters[state.characterIndex] &&
						<Typography
							textAlign={'center'}
							sx={{ mb: 1.5, display: 'flex', alignItems: 'center', justifyContent: 'center' }}
							color={'text.secondary'}
						>
							<CalendarMonthIcon sx={{ marginRight: '0.25rem' }} />
							{new Date(state.characters[state.characterIndex]?.DOB).toLocaleDateString()}
						</Typography>
					}

					<Typography
						textAlign={'center'}
						sx={{ mb: 1.5, display: 'flex', alignItems: 'center', justifyContent: 'center' }}
						color={'text.secondary'}
					>
						<AccessTimeIcon sx={{ marginRight: '0.25rem' }} />
						<span>
							Last Played:{' '}
							{!state.characters[state.characterIndex] || +state.characters[state.characterIndex].LastPlayed === -1 ? (
								<span className={classes.highlight}>Never</span>
							) : (
								<span className={classes.highlight}>
									<small>
										<Moment
											date={+state.characters[state.characterIndex].LastPlayed}
											format="M/D/YYYY h:mm:ss A"
											withTitle
										/>
									</small>
								</span>
							)}

						</span>
					</Typography>
				</CardContent>

				<CardActions
					sx={{ justifyContent: 'center' }}
				>
					<Button
						color={'success'}
						variant={'contained'}
						size={'medium'}
						startIcon={<FontAwesomeIcon icon={'fa-solid fa-circle-play'} />}
						onClick={() => {
							if (state.characters[state.characterIndex]) {
								props.getCharacterSpawns(selected)
							} else {
								props.showCreator()
							}
						}}
					>
						{state.characters[state.characterIndex] ? 'Play' : 'Create'}
					</Button>

					{state.characters[state.characterIndex] &&
						<Button
							color={'error'}
							variant={'contained'}
							size={'medium'}
							startIcon={<FontAwesomeIcon icon={'fas fa-trash'} />}
							onClick={() => {
								props.setOpen(true)
							}}
						>
							Delete
						</Button>
					}
				</CardActions>
			</Card>
		</Zoom>
	);
};

const mapStateToProps = (state) => ({});

export default connect(mapStateToProps, { getCharacterSpawns, showCreator })(Character);
