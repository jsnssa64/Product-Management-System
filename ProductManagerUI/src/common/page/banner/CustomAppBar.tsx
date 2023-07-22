import { Toolbar, Typography } from "@mui/material";
import React from "react";
import AppBar from '@mui/material/AppBar';


function CustomAppBar() {
    return (
        <React.Fragment>
            <AppBar position="static">
                <Toolbar>
                    <Typography variant="h6">
                        TOP BAR
                    </Typography>
                </Toolbar>
            </AppBar>
        </React.Fragment>
    );
  }

  export default CustomAppBar;