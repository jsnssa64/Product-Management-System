import { IUpdateBrand } from "@Components/Brand/BrandModel";
import { IBrand } from "@Data/brand/Brand";
import { createSlice, PayloadAction } from "@reduxjs/toolkit";

export const brandSlice = createSlice({
    name: "brand",
    initialState: [] as IBrand[],
    reducers: {
        Create: (state, action: PayloadAction<IBrand>): void => {
            action.payload.Id = state.length + 1;
            state.push(action.payload);
        },
        Remove: (state, action: PayloadAction<string>): void => {
            state.splice(0, state.findIndex((el) => el.Name == action.payload));
        },
        Update: (state, action: PayloadAction<IUpdateBrand>): void => {
            state.splice(0, state.findIndex((el) => el.Id == action.payload.Id));
            state.push({ 
                Id: 3,
                Name: action.payload.Name
            })
        }
    }
});

export const { Create, Remove, Update } = brandSlice.actions;

export default brandSlice.reducer;