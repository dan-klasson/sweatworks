import React from 'react'
import useFetch from 'fetch-suspense'
import { Row, Col } from 'reactstrap'
import { useStateValue } from './state';
import Paginate from './Paginate'

const Publication = () => {
  const [{ url }] = useStateValue();
  const response = useFetch( url )
  console.log( url )
  const publications = response.data.map((value, i) => <div key={ i }>{ value.title }</div>)
  console.log('total_pages: ', response.total_pages)
  return (
    <div>
      <Row>
        <Col>
          { publications }
        </Col>
      </Row>
      <Row>
        <Col>
          <Paginate page={ response.page } total_pages={ response.total_pages} />
        </Col>
      </Row>
    </div>
  )
}

export default Publication