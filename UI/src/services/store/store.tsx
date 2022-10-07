import { configureStore, combineReducers } from "@reduxjs/toolkit";
import productReducer from "@Services/slices/product/productSlice";
import brandReducer from "@Services/slices/brand/brandSlice";
import permissionReducer from "@Services/slices/permission/permissionSlice";

const mainReducers = combineReducers({
    product: productReducer,
    brand: brandReducer,
    permission: permissionReducer
})

const store = configureStore({
    reducer: mainReducers
    // middleware
    //  devtools
    //  preloadedstate
    //  enhancers
})

export default store;
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;