import { Box, Button, Grid, ListItem, ListItemText, TextField, Typography } from "@mui/material";
import * as React from "react";
import { useState, useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { AppDispatch, RootState } from "services/store/store";
import * as Actions from "@Services/slices/brand/brandSlice";
import CustomList from "@Common/form/ListBase";
import * as Style from "@Components/Brand/BrandManager.style";
import { IUpdateBrand } from "./BrandModel";
import { IBrand } from "@Data/brand/Brand";
import { ButtonModel, CRUDButtonModel } from "@Common/general/buttons/buttonsCrudModel";
import ButtonsCRUD from "@Common/general/buttons/buttonsCrud";
 

class ButtonBuilder {
    constructor(
        public buttonText: string,
        public handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void,
        public buildButton: (buttonText: string, handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void) => JSX.Element){ }
}

interface IBrandState {
    Select?: IBrand,
    CurrentValue: string
}
enum States {
    Create,
    Delete,
    Update
}

export default function BrandManager() {
    //  
    const [formValues, setFormValues] = useState<IBrandState>({
        Select: null,
        CurrentValue: ""
    } as IBrandState);
    const [errorMessage, setErrorMessage] = useState("");
    const [formState, setFormState] = useState<States>(States.Create);
    const [buttonElement, setButtonElement] = useState<JSX.Element>();

    const globalBrand = useSelector((state: RootState) => state.brand);
    const globalPermission = useSelector((state: RootState) => state.permission);
    const dispatch: AppDispatch = useDispatch();

    useEffect(() => {
        const buttonModel = buttonFormStates[States[formState]];
        setButtonElement(buttonModel.buildButton(buttonModel.buttonText, buttonModel.handleClick))
    }, [formValues]);

    useEffect(() => {
        const buttonModel = buttonFormStates[States[formState]];
        setButtonElement(buttonModel.buildButton(buttonModel.buttonText, buttonModel.handleClick))
    }, [formState]);

    const saveButton = (buttonText: string, handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void) => {
        console.log("SaveButton Re-run");
        return (<TextField
            variant="standard"
            required
            id="outlined-required"
            label="Required"
            value={formValues.CurrentValue}
            onChange={handleChange}
            InputProps={{endAdornment: <Button variant="contained" onClick={handleClick}>{ buttonText }</Button>}}
        />);}

    const updateButton = (buttonText: string, handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void) => {
        return (<TextField
            variant="standard"
            required
            id="outlined-required"
            label="Required"
            value={formValues.CurrentValue}
            onChange={handleChange}
            InputProps={{endAdornment: <Button variant="contained" onClick={handleClick}>{ buttonText }</Button>}}
        />);}

    const deleteButton = (buttonText: string, handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void) => {
        return (<TextField
            variant="standard"
            required
            id="outlined-required"
            label="Required"
            value={formValues.CurrentValue}
            onChange={handleChange}
            InputProps={{endAdornment: <Button variant="contained" onClick={handleClick}>{ buttonText }</Button>}}
        />);}
    
    

    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        event.preventDefault();
        setFormValues({
            ...formValues, CurrentValue: event.target.value
        } as IBrandState);
    }    
    
    const handleSave = (event: React.MouseEvent<HTMLButtonElement>) => {
        event.preventDefault();
        const ifPresent = globalBrand.find(brand => brand.Name == formValues.CurrentValue)

        if(formValues.CurrentValue !== "" && !ifPresent) {
            dispatch(Actions.Create({
                Id: Math.random(),
                Name: formValues.CurrentValue
            } as IBrand));
            setFormValues({
                CurrentValue: ""
            } as IBrandState);
        }
    }

    const handleUpdate = (event: React.MouseEvent<HTMLButtonElement>) => {
        event.preventDefault();
        const ifPresent = globalBrand.find(brand => brand.Name == formValues.Select.Name)

        if(formValues.CurrentValue.trim() !== "" && ifPresent) {
            let update = {
                Id: formValues.Select.Id,
                Name: formValues.CurrentValue
            } as IUpdateBrand;
            dispatch(Actions.Update(update));
            setFormValues({
                CurrentValue: ""
            } as IBrandState);
        }
        else {
            setErrorMessage("Doesn't Exist");
        }
    }

    const handleDelete = (event: React.MouseEvent<HTMLButtonElement>) => {
        event.preventDefault();
        const ifPresent = globalBrand.find(brand => brand.Name == formValues.Select.Name)

        if(ifPresent) {
            dispatch(Actions.Remove(formValues.Select.Name));
            setFormValues({
                CurrentValue: ""
            } as IBrandState);
        }
        else {
            setErrorMessage("Failed to Delete");
        }
    }

    const switchButton = (event: React.MouseEvent<HTMLButtonElement, MouseEvent>) => {
        const buttonType = event.currentTarget.dataset["buttonType"];
        setFormState(States[buttonType as keyof typeof States])
    }

    const buttonFormStates: { [key: string]: ButtonBuilder } = {
        Update: new ButtonBuilder("Update", handleUpdate, updateButton),
        Create: new ButtonBuilder( "Create", handleSave, saveButton),
        Delete: new ButtonBuilder( "Delete", handleDelete, deleteButton)
    };


    const CRUDButtonsModel: CRUDButtonModel = {
        Update: new ButtonModel("Update", globalPermission["canUpdate"]?.enabled, switchButton),
        Delete: new ButtonModel("Delete", globalPermission["canDelete"]?.enabled, switchButton),
        Create: new ButtonModel("Create", globalPermission["canCreate"]?.enabled, switchButton)
    };

    const handleListBuild = (value: any, index: number): JSX.Element => {
        return (
            <ListItem key={index}>
                <ListItemText>{value.Name}</ListItemText>
                <ButtonsCRUD model={CRUDButtonsModel}></ButtonsCRUD>       
            </ListItem>
            );                        
    };

    return (
        <Box>
            <Style.pageHeader variant="h3" gutterBottom>Brand Management</Style.pageHeader>
            <Grid container direction="row"  spacing={2}>
                <Grid item xs={6} md={6}>
                    <Style.leftBox>
                        {
                            formValues.CurrentValue
                        }
                        <CustomList handleListBuild={handleListBuild} data={globalBrand}>
                        </CustomList>
                    </Style.leftBox>
                    <Style.rightDivider orientation="vertical" variant="middle" flexItem/>
                </Grid>
                <Grid item xs={6} md={6}>
                    <Typography variant="h5" gutterBottom>Brand Manager</Typography>
                    {errorMessage && (
                        <Box> {errorMessage} </Box>
                    )}
                    <Style.formBM>
                        <Box
                        component="form"
                        noValidate
                        autoComplete="off"
                        >
                            {
                                buttonElement
                            }
                        </Box>
                    </Style.formBM>
                </Grid>
            </Grid>
        </Box>
    )
}
