// src/ProductForm.tsx
import React, { useState, FormEvent } from 'react';

interface Product {
  unit: string;
  productName: string;
  productType: string;
}

const ProductForm: React.FC = () => {
  const [product, setProduct] = useState<Product>({
    unit: '',
    productName: '',
    productType: ''
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    console.log("Before: " + JSON.stringify(product));
    setProduct({ ...product, [name]: value });
    console.log("After: " +  JSON.stringify(product));
  };

  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    console.log("Before: " + product);
    setProduct({ unit: '', productName: '', productType: '' });
    // Push to API
    console.log("After: " +  JSON.stringify(product));
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="unit">Unit:</label>
        <input type="text" id="unit" name="unit" value={product.unit} onChange={handleChange} />
      </div>
      <div>
        <label htmlFor="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" value={product.productName} onChange={handleChange} />
      </div>
      <div>
        <label htmlFor="productType">Product Type:</label>
        <select id="productType" name="productType" value={product.productType} onChange={handleChange}>
          <option value="">Select a product type</option>
          <option value="type1">Type 1</option>
          <option value="type2">Type 2</option>
          <option value="type3">Type 3</option>
        </select>
      </div>
      <button type="submit">Submit</button>
    </form>
  );
};

export default ProductForm;