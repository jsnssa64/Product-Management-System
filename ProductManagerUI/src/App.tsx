import { ThemeProvider } from '@mui/material/styles';
import { Container } from '@mui/system';
import Navigation from '@Common/page/navigation/Navigation';
import HomePage from '@Pages/HomePage';
import Product from '@Pages/Product';
import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import theme from './theme/generalTheme';
import CustomAppBar from '@Common/page/banner/CustomAppBar';
import { CssBaseline } from '@mui/material';


export default function App(){
  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <CustomAppBar></CustomAppBar>
      <Router>
        <Routes>
          <Route path="/" element={<Navigation/>}>
            <Route index element={<HomePage />} />
            <Route path="/product" element={<Product/>} />
            <Route path="*" element={<HomePage />} />
          </Route>
        </Routes>
      </Router>
      <main>
        <div>
          <Container maxWidth="lg">
              COntainer
          </Container>
        </div>
      </main>
    </ThemeProvider>
      
    )
}