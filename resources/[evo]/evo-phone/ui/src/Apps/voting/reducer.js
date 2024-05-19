export const initialState = {
	// tab: 0,
	// voted: {},
	// candidates: {
	// 	'Commissioner': [
	// 		{ id: 1, vote_category: 'Commissioner', label: 'Aspect', amount: 10 },
	// 		{ id: 2, vote_category: 'Commissioner', label: 'Boris Johnson', amount: 50 },
	// 		{ id: 3, vote_category: 'Commissioner', label: 'Rishi Sunak', amount: 200 }
	// 	],
	// 	'Major': [
	// 		{ id: 4, vote_category: 'Major', label: 'Aspect', amount: 500 },
	// 		{ id: 5, vote_category: 'Major', label: 'Koi', amount: 0 },
	// 		{ id: 6, vote_category: 'Major', label: 'EvoRP', amount: 50 }
	// 	],
	// }

	tab: 0,
	voted: {},
	candidates: {}
};

export default (state = initialState, action) => {
	switch (action.type) {
		case 'SET_VOTING_CANDIDATES':
			return {
				...state,
				candidates: action.payload.data,
			};
		case 'SET_VOTING_RESULTS':
			return {
				...state,
				results: action.payload.data,
			};
		case 'SET_VOTING_TAB':
			return {
				...state,
				tab: action.payload.tab,
			};
		case 'SET_VOTES_DONE':
			return {
				...state,
				voted: action.payload.data,
			};
		case 'UI_RESET':
			return {
				...initialState,
			};
		default:
			return state;
	}
};
