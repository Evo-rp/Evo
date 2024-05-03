/* eslint-disable react/prop-types */
import React from 'react';
import { connect } from 'react-redux';
import { makeStyles } from '@mui/styles';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

import { selectSpawn, spawnToWorld } from '../actions/characterActions';
import { ListItem, ListItemButton, ListItemIcon, ListItemText } from '@mui/material';

const SpawnButton = (props) => {
	const onClick = () => {
		if (props?.selectedSpawn?.id === props.spawn.id) {
			props.spawnToWorld(props.selectedSpawn, props.selectedChar);
		} else {
			props.selectSpawn(props.spawn);
		}
	};

	function isOdd(number) {
		return number % 2 !== 0;
	}

	const calculateBackground = () => {
		if (props?.selectedSpawn?.id === props.spawn.id) {
			return '#2f4a21'
		} else {
			return isOdd(props.index) ? '#061220' : '#000d1b'
		}
	}

	return (
		<ListItemButton
			sx={{
				backgroundColor: calculateBackground()
			}}
			onClick={onClick}
		>
			<ListItemIcon
				// className={''.concat(props.spawn.icon, ' selected')}
				color={props.spawn.label === 'Alta Street' ? '#fa790f' : 'white'}
				style={{
					color: props.spawn.label === 'Alta Street' ? '#fa790f' : 'white',
					fontSize: 26
				}}
			>
				<FontAwesomeIcon
					icon={props.spawn.icon ? props.spawn.icon : 'fas fa-location-dot'}
					style={{
						stroke: 'black',
						strokeWidth: 10,
					}}
				/>
			</ListItemIcon>

			<ListItemText>
				{props.spawn.label}
			</ListItemText>
		</ListItemButton>
	);
};

const mapStateToProps = (state) => ({
	selected: state.characters.selected,
	selectedSpawn: state.spawn.selected,
	selectedChar: state.characters.selected,
});

export default connect(mapStateToProps, { selectSpawn, spawnToWorld })(SpawnButton);
