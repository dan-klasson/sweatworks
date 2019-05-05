import React from 'react'
import { Container, Row, Col } from 'reactstrap'
import { useStateValue } from './state'
import Publication from './Publication'
import Author from './Author'

const Main = () => {
  const [ { inverted }, dispatch] = useStateValue()

  return (
    <Container>
      <Row>
        <Col xs="3">
          <div>
            <button onClick={ () => dispatch( { type: 'all' } ) }>All</button>
          </div>
          <Author />
        </Col>
        <Col xs="9">
          <button onClick={ () => {
            dispatch( { type: 'invert' } )
          }}>{ !inverted ? 'Sort ascending' : 'Sort descending' }</button>
          <Publication />
        </Col>
      </Row>
    </Container>
  )
}

export default Main