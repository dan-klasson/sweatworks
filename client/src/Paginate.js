import React from 'react';
import { Pagination, PaginationItem, PaginationLink } from 'reactstrap';
import { useStateValue } from './state';

const Paginate = (props) => {
  const [, dispatch ] = useStateValue();

  const pages = [...Array( props.total_pages ).keys()].map((index) =>
    <PaginationItem
      key={ index }
      active={ (index + 1) === props.page ? true : false }
    >
      <PaginationLink
        href="#" onClick={ () => dispatch( { type: 'paginate', page: index + 1 } ) }
      >
        { index + 1 }
      </PaginationLink>
    </PaginationItem>
  )
  return (
    <Pagination>
    <PaginationItem>
        <PaginationLink
          first
          href="#"
          onClick={ () => dispatch( { type: 'paginate', page: 1 } ) }
        />
      </PaginationItem>
      { pages }
      <PaginationItem>
        <PaginationLink
          last
          href="#"
          onClick={ () => dispatch( { type: 'paginate', page: props.total_pages } ) }
        />
      </PaginationItem>
    </Pagination>
  )
}

export default Paginate