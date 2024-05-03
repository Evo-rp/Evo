import { APP_RESET, APP_SHOW, APP_HIDE, SET_STATE, SET_NAME } from '../../actions/types';
import { STATE_SPLASH } from '../../util/States';

export const initialState = {
	hidden: true,
	state: STATE_SPLASH,
	name: 'Aspect'
};

const appReducer = (state = initialState, action) => {
	switch (action.type) {
		case APP_SHOW:
			return { ...state, hidden: false };
		case APP_HIDE:
			return { ...state, hidden: true };
		case SET_STATE:
			return { ...state, state: action.payload.state };
		case APP_RESET:
			return {
				...initialState,
				hidden: false,
			};
		case SET_NAME:
			return {
				...state,
				name: action.payload.name
			}
		default:
			return state;
	}
};

export default appReducer;
