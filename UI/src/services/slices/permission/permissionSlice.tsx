import { createSlice, PayloadAction } from "@reduxjs/toolkit";

interface IPermission {
    [name:string] : {enabled: boolean}
}

export const permissionSlice = createSlice({
    name: "permission",
    initialState: {} as IPermission,
    reducers: {
        enablePermission: (state, action: PayloadAction<string>): void => {
                state[action.payload] = {
                    enabled: true
                };
        },
        disablePermission: (state, action: PayloadAction<string>): void => {
            state[action.payload] = {
                enabled: false
            };
        }
    }
});

export const { enablePermission, disablePermission } = permissionSlice.actions;

export default permissionSlice.reducer;