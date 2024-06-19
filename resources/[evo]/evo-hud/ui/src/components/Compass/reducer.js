export const initialState = {
    showing: false,
    location: {
        main: 'Aspects St',
        cross: 'Evo Dr',
        area: 'KFC',
        heading: 100,
    },
};

export default (state = initialState, action) => {
    switch (action.type) {
        case 'TOGGLE_LOC':
            return {
                ...state,
                showing: !state.showing,
            };
        case 'UPDATE_LOCATION':
            return {
                ...state,
                location: action.payload.location,
            };
        default:
            return state;
    }
};
