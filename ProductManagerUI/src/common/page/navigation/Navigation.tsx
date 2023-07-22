import React from 'react';
import { Link, Outlet } from 'react-router-dom';

const Navigation: React.FC = () => {
  return (
    <div>
      <nav>
        <div className="nav-wrapper">
          <a href='#' className='brand-logo'>Logo</a>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/product">Product</Link>
              </li>
              <li>
                <Link to="/nothing-here">Nothing Here</Link>
              </li>
            </ul>
        </div>
      </nav>
      <hr />
      <Outlet />
    </div>
  );
};

export default Navigation;