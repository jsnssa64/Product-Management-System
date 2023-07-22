import { createTheme } from "@mui/material";
import baseSecondary from "./basePaletteColor/secondary";
import basePrimary from "./basePaletteColor/primary";
import baseError from "./basePaletteColor/error";
import baseWarning from "./basePaletteColor/warning";
import baseSuccess from "./basePaletteColor/success";
import baseTypography from "./baseTypography/baseTypography";


const theme = createTheme({
    palette: {
      primary: basePrimary,
      secondary: baseSecondary,
      error: baseError,
      warning: baseWarning,
      success: baseSuccess
    },
    typography: baseTypography
  });

  export default theme;