import React, { Suspense } from 'react'
import './App.css'
import Author from './Author'


function App() {
  return (
    <Suspense fallback="Loading...">
      <Author />
    </Suspense>
  )
}

export default App
