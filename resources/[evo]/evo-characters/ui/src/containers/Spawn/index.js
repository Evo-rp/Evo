import React, { useEffect, useRef, useState } from 'react';
import { connect } from 'react-redux';
import { FormControl, InputLabel, MenuItem, Select, Tooltip } from '@mui/material';
import { makeStyles } from '@mui/styles';
import { deselectCharacter, selectSpawn } from '../../actions/characterActions';
import SpawnIcon from '../../components/SpawnIcon';

const useStyles = makeStyles((theme) => ({
	spawnBox: {
		padding: "0",
		overflow: "hidden",
		color: "rgba(162, 162, 162, 0.85)",
		marginLeft: "10.4%",
		marginTop: "1%",
		width: "80%",
		height: "95vh",
		display: "flex",
		minWidth: "0",
		textAlign: "center",
		fontSize: "25px",
	},

	zeroPoint: {
		backgroundColor: "none",
		color: "white",
		width: "0.1%",
		height: "0.1vh",
		marginLeft: "50.8%",
		marginTop: "30.2%",
		display: "flex",
		position: "absolute",
	},
	spawnPoint: {
		width: " 1%",
		height: "1vh",
		display: "flex",
		position: "absolute",
		minWwidth: "0",
		textAlign: "center",
		fontSize: "25px",
		color: "red"
	},
}));

const Spawn = (props) => {
	const classes = useStyles();
	const zeroPointRef = useRef();

	const goBack = () => {
		props.deselectCharacter();
	};

	const getCorrectXY = (origX, origY) => {
		const maxRangeY = 4740 // do not change these 
		const maxRangeX = 3780 // do not change these

		const childPos = zeroPointRef.current.getBoundingClientRect();
		const parentPos = zeroPointRef.current.parentElement.getBoundingClientRect();

		const childOffset = {
			top: childPos.top - parentPos.top,
			left: childPos.left - parentPos.left
		}

		const leftInToZero = childOffset.left
		const topInToZero = childOffset.top

		const maxNewRangeY = document.getElementById("spawnBox").clientWidth - leftInToZero
		const maxNewRangeX = document.getElementById("spawnBox").clientHeight - topInToZero

		const scaledOx = topInToZero - scaleBetween(origX, 0, maxNewRangeX, 0.0, maxRangeX)
		const scaledOy = leftInToZero - scaleBetween(origY, 0, maxNewRangeY, 0.0, maxRangeY)

		return [scaledOx, scaledOy]
	};

	const scaleBetween = (unscaledNum, minAllowed, maxAllowed, min, max) => {
		return (maxAllowed - minAllowed) * (unscaledNum - min) / (max - min) + minAllowed;
	};

	const [convertedSpawn, setConvertedSpawns] = useState([])

	useEffect(() => {
		const handleResize = () => {
			const convertSpawns = props?.spawns.map(spawn => {
				const correctCoordinate = getCorrectXY(spawn.location.x, spawn.location.y);

				return {
					...spawn,
					posX: correctCoordinate[0],
					posY: correctCoordinate[1]
				};
			});

			setConvertedSpawns(convertSpawns);
		};

		window.addEventListener("resize", handleResize);

		handleResize();

		return () => window.removeEventListener("resize", handleResize);
	}, [props?.spawns]);

	return (
		<>
			<div
				className={classes.container}
			>
				<div
					className={classes.spawnBox}
					id={'spawnBox'}
				>
					<div
						className={classes.zeroPoint}
						id={'zeropoint'}
						ref={zeroPointRef}
					/>

					{convertedSpawn.map((spawn, i) => {
						if (spawn.icon === 'house') return;
						return (
							<SpawnIcon spawn={spawn} />
						)
					})}

					<FormControl style={{ position: 'absolute', width: '15%', right: '28vh', top: '7.5vh' }} variant="standard">
						<InputLabel id="demo-simple-select-standard-label">Property Spawn</InputLabel>
						<Select
							labelId="demo-simple-select-standard-label"
							id="demo-simple-select-standard"
							label="Property Spawn"
						>
							{convertedSpawn.map((spawn, i) => {
								if (spawn.icon !== 'house') return;
								return (
									<MenuItem
										value={spawn.label}
										onClick={() => {
											props.selectSpawn(spawn);
										}}
									>
										{spawn.label}
									</MenuItem>
								)
							})}
						</Select>
					</FormControl>
				</div>
			</div>
		</>
	);
};

const mapStateToProps = (state) => ({
	spawns: state.spawn.spawns,
	selected: state.spawn.selected,
});

export default connect(mapStateToProps, {
	deselectCharacter,
	selectSpawn
})(Spawn);
