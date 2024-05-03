import {
	APP_RESET,
	SET_SPAWNS,
	SELECT_SPAWN,
	DESELECT_SPAWN,
} from '../../actions/types';

export const initialState = {
	spawns: Array(),
	selected: null,

	// spawns: [
	// 	{
	// 		id: 1,
	// 		label: "LSIA",
	// 		icon: 'fas fa-location-dot',
	// 		location: { x: -1044.84, y: -2749.85, z: 21.36, h: 0.0 },
	// 	},
	// ]
};

const spawnReducer = (state = initialState, action) => {
	switch (action.type) {
		case SET_SPAWNS:
			return { ...state, spawns: action.payload.spawns };
		case SELECT_SPAWN:
			return { ...state, selected: action.payload };
		case DESELECT_SPAWN:
			return { ...state, selected: null };
		case APP_RESET:
			return { ...initialState };
		default:
			return state;
	}
};

export default spawnReducer;
