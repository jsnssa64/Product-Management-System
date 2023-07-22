import styled from "@emotion/styled"
import { Box, Divider, Grid, Typography } from "@mui/material"

const pageHeader = styled(Typography)`
    margin-top: 3%
`

const leftBox = styled(Box)`
    width: 99%;
    float: left
`

const rightDivider = styled(Divider)`
    height: 100%;
    width: 1%;
    margin: '0px'
`

const formBM =  styled(Box)`
    & .MuiTextField-root { 
        margin: 2px;
        width: 100% 
    }
    justify-content: center;
    align-items: center;
    display: flex;
`
export {leftBox, rightDivider, formBM, pageHeader}