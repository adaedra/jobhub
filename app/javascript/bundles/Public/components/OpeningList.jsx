import React from 'react'
import { Link } from 'react-router-dom'

const OpeningList = ({ openings }) => {
  return (
    <>
      <h1>Active openings</h1>
      <ul>
        {openings.map(opening => <li key={opening.id}><Link to={`/openings/${opening.id}`}>{opening.title}</Link></li>)}
      </ul>
    </>
  )
}

export default OpeningList
