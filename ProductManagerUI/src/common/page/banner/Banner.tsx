// src/Banner.tsx
import React from 'react';

const Banner: React.FC = () => {
  return (
    <div className="container">
      <div className="section">
        <div className="row">
          <div className="col s12 center">
            <h3>
              <i className="mdi-content-send brown-text"></i>
            </h3>
            <h4>Banner Title</h4>
            <p className="left-align light">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque id nunc nec volutpat. Etiam
              pellentesque tristique arcu, non consequat magna fermentum ac. Cras ut ultricies justo, at ullamcorper purus. Etiam lacinia suscipit libero. Aenean congue sapien aliquam vestibulum bibendum. Etiam euismod velit ut elementum elementum.
            </p>
          </div>
        </div>
      </div>
    </div>
  ); 
};


export default Banner;