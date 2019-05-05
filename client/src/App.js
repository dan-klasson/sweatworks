import React, { Suspense } from 'react'
import { Navbar, NavbarBrand } from 'reactstrap';
import './App.scss'
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
      </Navbar>

      <Suspense fallback="Loading...">
        <Main />
      </Suspense>
    </StateProvider>
  );
}

export default App
