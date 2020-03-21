import React from 'react'

const OpeningList = ({ openings }) => {
  return (
    <>
      <h1>Active openings</h1>
      <ul>
        {openings.map(opening => <li key={opening.id}>{opening.title}</li>)}
      </ul>
    </>
  )
}

export default OpeningList
