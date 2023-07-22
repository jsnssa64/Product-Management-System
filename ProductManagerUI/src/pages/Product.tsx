import React from 'react';
import ProductForm from '@Components/Product/ProductForm';
import Banner from '@Common/page/banner/Banner';

const App: React.FC = () => {
  return (
    <div>
        <Banner/>
        <h1>Product Form</h1>
        <ProductForm />
    </div>
  );
};

export default App;