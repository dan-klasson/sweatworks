import React from 'react'
import useFetch from 'fetch-suspense'
import { Table, Row, Col } from 'reactstrap'
import { useStateValue } from './state';
import Paginate from './Paginate'

const Publication = () => {
  const [{ url }] = useStateValue();
  const response = useFetch( url )
  const tbody = response.data.map((value, i) => {
    return (
      <tr key={ i }>
        <th scope="row">{ value.id }</th>
        <td>{ value.author.name}</td>
        <td>{ value.author.email}</td>
        <td>{ value.title }</td>
      </tr>
    )
  })
  return (
    <div>
      <Row>
        <Col>
          <Table>
            <thead>
              <tr>
                <th>#</th>
                <th>Author</th>
                <th>Email</th>
                <th>Title</th>
              </tr>
            </thead>
            <tbody>
              { tbody }
            </tbody>
          </Table>
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