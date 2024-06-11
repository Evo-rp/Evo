/* eslint-disable react/no-array-index-key */
/* eslint-disable react/prop-types */
import React from 'react';
import { connect, useDispatch } from 'react-redux';
import {
	Button,
	Dialog,
	DialogActions,
	DialogContent,
	DialogContentText,
	DialogTitle,
	FormControl,
	InputLabel,
	MenuItem,
	Select,
} from '@mui/material';

import Character from '../../components/Character';
import { showCreator, deleteCharacter, getCharacterSpawns } from '../../actions/characterActions';

const Characters = (props) => {
    const dispatch = useDispatch();
	const [open, deleteOpen] = React.useState(false);

	const deleteChar = () => {
		props.deleteCharacter(props.selected.ID);
		setOpen(false);
	};

	const setOpen = (state) => {
		if (state) {
			dispatch({
				type: 'SET_UPDATE_SELECT',
				payload: {
					state: false
				}
			})
			deleteOpen(true)
		} else {
			dispatch({
				type: 'SET_UPDATE_SELECT',
				payload: {
					state: true
				}
			})
			deleteOpen(false)
		}
	}

	return (
		<>
			<FormControl style={{ position: 'absolute', width: '15%', right: '1vh', top: '0.5vh' }} variant="standard">
				<InputLabel id="demo-simple-select-standard-label">Select Character</InputLabel>
				<Select
					labelId="demo-simple-select-standard-label"
					id="demo-simple-select-standard"
					label="Select Character"
				>
					{props.characters.map((char) => {
						return (
							<MenuItem
								value={char.SID}
								onClick={() => {
									props.getCharacterSpawns(char)

									setTimeout(() => {
										dispatch({
											type: 'SELECT_CHARACTER',
											payload: {
												character: char
											}
										})
									}, 500)
								}}
							>
								{char.First} {char.Last} 
							</MenuItem>
						)
					})}

					<MenuItem
						value={'Create Character'}
						onClick={() => props.showCreator()}
						disabled={props.characters.length === 7}
					>
						Create Character
					</MenuItem>
				</Select>
			</FormControl>

			<Character setOpen={setOpen} />

			{props.selected != null && (
				<Dialog open={open} onClose={() => setOpen(false)}>
					<DialogTitle>{`Delete ${props.selected.First} ${props.selected.Last}?`}</DialogTitle>
					<DialogContent>
						<DialogContentText>
							Are you sure you want to delete {props.selected.First} {props.selected.Last}? This action is
							completely & entirely irreversible by{' '}
							<i>
								<b>anyone</b>
							</i>{' '}
							including staff. Proceed?
						</DialogContentText>
					</DialogContent>
					<DialogActions>
						<Button onClick={() => setOpen(false)} color="inherit">
							No
						</Button>
						<Button onClick={deleteChar} color="primary" autoFocus>
							Yes
						</Button>
					</DialogActions>
				</Dialog>
			)}
		</>
	);
};

const mapStateToProps = (state) => ({
	characters: state.characters.characters,
	selected: state.characters.selected,
	changelog: state.characters.changelog,
	motd: state.characters.motd,
});

export default connect(mapStateToProps, {
	deleteCharacter,
	getCharacterSpawns,
	showCreator,
})(Characters);
