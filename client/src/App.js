import React, { Suspense } from 'react'
import {
  Container,
  Row,
  Col,
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink} from 'reactstrap';
import './App.css'
import Author from './Author'


function App() {
  return (
    <div>
      <Navbar color="dark" dark expand="md">
        <NavbarBrand href="/">sweatworks</NavbarBrand>
        <NavbarToggler />
        <Collapse navbar>
          <Nav className="ml-auto" navbar>
            <NavItem>
              <NavLink href="/"></NavLink>
            </NavItem>
          </Nav>
        </Collapse>
      </Navbar>

      <Suspense fallback="Loading...">
        <Container>
          <Row>
            <Col xs="3"><Author /></Col>
            <Col xs="auto"></Col>
          </Row>
        </Container>
      </Suspense>
    </div>
  )
}

export default App
