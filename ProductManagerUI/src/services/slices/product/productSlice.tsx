import { IProduct } from "@Data/product/product/IProduct";
import { createSlice, PayloadAction } from "@reduxjs/toolkit";

export const productSlice = createSlice({
    name: "product",
    initialState: [] as IProduct[],
    reducers: {
        CreateProduct: (state, action: PayloadAction<IProduct>): void => {
            state.push(action.payload)
        },
        RemoveProduct: (state, action: PayloadAction<number>): void => {
            state.splice(0, state.findIndex((el) => el.Id == action.payload));
        },
        UpdateProduct: (state, action: PayloadAction<IProduct>): void => {
            let obj = state.find(x => x.Id === action.payload.Id);
            obj = {
                ...action.payload
            };
            console.log("UpdateProduct:");
            console.log(obj);
        }
    }
});

export const { CreateProduct, RemoveProduct, UpdateProduct } = productSlice.actions

export default productSlice.reducer;