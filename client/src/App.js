import React, { Suspense } from 'react'
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink} from 'reactstrap';
import './App.css'
import Main from './Main'
import { UrlReducer } from './reducers'
import { StateProvider } from './state';

const App = () => {
  const base = process.env.REACT_APP_BASE_URL
  const initialState = { inverted: false, url: `${ base }/publications?sort=published_at` }

  return (
    <StateProvider initialState={ initialState } reducer={ UrlReducer }>
      <Navbar color="dark" dark expand="md">
        <NavbarBrand href="/">sweatworks</NavbarBrand>
        <NavbarToggler />
        <Collapse navbar>
          <Nav className="ml-auto" navbar>
            <NavItem>
              <NavLink href="/" />
            </NavItem>
          </Nav>
        </Collapse>
      </Navbar>

      <Suspense fallback="Loading...">
        <Main />
      </Suspense>
    </StateProvider>
  );
}

export default App
