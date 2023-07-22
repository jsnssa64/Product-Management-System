import { TypographyOptions } from '@mui/material/styles/createTypography';

const baseTypography: TypographyOptions = {
  fontFamily: 'Arial, sans-serif',
  fontSize: 14,
  fontWeightLight: 300,
  fontWeightRegular: 400,
  fontWeightMedium: 500,
  fontWeightBold: 700,
  h1: {
    fontSize: '2rem',
    fontWeight: 'bold',
    color: '#333',
  },
  h2: {
    fontSize: '1.5rem',
    fontWeight: 'bold',
    color: '#666',
  },
  body1: {
    fontSize: '1rem',
    color: '#333',
  },
  button: {
    textTransform: 'none',
    fontWeight: 'bold',
  },
};

export default baseTypography;