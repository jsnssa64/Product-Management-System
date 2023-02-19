import { AppBar, CssBaseline, Toolbar, Typography } from '@mui/material';
import { purple } from '@mui/material/colors';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import { Container } from '@mui/system';
import * as React from 'react'
import BrandManager from './components/Brand/BrandManager';
import Stock, { ProductManager } from './components/Product/ProductManager';

const theme = createTheme({
  palette: {
    primary: {
      main: purple[500],
    },
    secondary: {
      main: '#f44336',
    },
  },
});

export default function App(){
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
        <AppBar position="relative">
          <Toolbar>
            <Typography variant="h6">
              Top bar
            </Typography>
          </Toolbar>
        </AppBar>
        <main>
          <div>
            <Container maxWidth="lg">
              <ProductManager />
              <BrandManager />
            </Container>
          </div>
        </main>
    </ThemeProvider>
      
    )
}