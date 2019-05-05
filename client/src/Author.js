import React from 'react'
import useFetch from 'fetch-suspense'
import { useStateValue } from './state';

const Author = () => {
  const base = process.env.REACT_APP_BASE_URL
  const authors = useFetch(`${ base }/authors`)
  const [, dispatch] = useStateValue()

  return authors.map((value, i) =>
    <div key={ i }>
      <button
        onClick={ () => dispatch( { type: 'index', id: value.id } ) }
        >
        { value.name }
      </button>
    </div>
  )
}

export default Author