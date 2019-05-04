import React from 'react'
import useFetch from 'fetch-suspense'
import { useStateValue } from './state';

const Publication = () => {
  const [{ url }] = useStateValue();
  const data = useFetch( url )
  return data.map((value, i) => <div key={ i }>{ value.title }</div>)
}

export default Publication