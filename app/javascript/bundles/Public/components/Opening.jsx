import React from 'react'
import { Link } from 'react-router-dom'

const Opening = props => {
  const { title, company, description } = props

  return (
    <div className='p-4 container-md'>
      <Link to='/openings'>Back to openings view</Link>

      <div className='jumbotron'>
        <h1>{title}</h1>
        <p className='lead'>{company}</p>
      </div>
      <div>
        {description}
      </div>
      <hr />
      <div className='text-muted text-center'>
        This offer is hosted on JobHub
      </div>
    </div>
  )
}

export default Opening
