import { Grid, List, styled } from '@mui/material';
import * as React from 'react';
import { GridContainer } from "./FormBase.style";

type ListProps = {
    handleListBuild: (value: any, index: number) => JSX.Element;
    data: any[];
    children: React.ReactNode;
};

function ListBase({ handleListBuild, data }: ListProps ) {
    return (
        <GridContainer container direction="column">
            <Grid item>
                <List>
                    {data.map(handleListBuild)}
                </List>
            </Grid>
        </GridContainer>
    )
}

export default ListBase

