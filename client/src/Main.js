import React, { useState } from 'react'
import { Input, Container, Row, Col } from 'reactstrap'
import { useStateValue } from './state'
import Publication from './Publication'
import Author from './Author'

const Main = () => {
  const [ { inverted }, dispatch] = useStateValue()
  const [ search, setSearch ] = useState('')

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
          <Row>
            <Col xs="6">
              <button onClick={ () => {
                dispatch( { type: 'invert' } )
              }}>{ !inverted ? 'Sort ascending' : 'Sort descending' }</button>
            </Col>
            <Col xs="6">
              <Input
                type="text"
                value={ search }
                onChange={ e => setSearch( e.target.value )}
                onKeyPress={event => {
                  if (event.key === 'Enter') {
                    dispatch( { type: 'search', q: search } )
                  }
                }}
                placeholder="Search..."
              />
            </Col>
          </Row>
          <Publication />
        </Col>
      </Row>
    </Container>
  )
}

export default Main