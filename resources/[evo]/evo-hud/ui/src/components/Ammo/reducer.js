export const initialState = {
    showing: false,
    onlyTotal: false,
    Total: 0,
    Clip: 0,
};

export default (state = initialState, action) => {
    switch (action.type) {
        case 'UI:Ammo:Visibility':
            return {
                ...state,
                showing: action.payload.state,
            };
        case 'UI:Ammo:SetData':
            return {
                ...state,
                Total: action.payload.total,
                Clip: action.payload.clipAmmo,
                onlyTotal: action.payload.onlyTotal,
            };
        default:
            return state;
    }
};
