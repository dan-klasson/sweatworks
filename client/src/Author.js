import React from 'react'
import useFetch from 'fetch-suspense'

export default function Author() {
  const url = process.env.REACT_APP_BASE_URL
  const data = useFetch(`${ url }/api/v1/authors`)
  return data.map((value, i) => <div key={i}>{ value.name }</div>)
}