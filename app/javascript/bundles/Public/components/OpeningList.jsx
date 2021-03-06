import React from 'react'
import { Link } from 'react-router-dom'
import { FormattedMessage } from 'react-intl'

const OpeningCard = ({ id, title, company }) => {
  return (
    <div className='col mb-4'>
      <div className='card h-100'>
        <div className='card-body'>
          <h2 className='card-title'>{title}</h2>
          <div className='text-muted'>{company}</div>
        </div>
        <div className='card-footer'>
          <Link to={`/openings/${id}`}>
            <FormattedMessage id='views.public.index.open' />
          </Link>
        </div>
      </div>
    </div>
  )
}

const OpeningList = ({ openings }) => {
  return (
    <div className='p-4 container-md'>
      <h1>
        <FormattedMessage id='views.public.index.title' />
      </h1>
      <div className='row row-cols-1 row-cols-md-2 row-cols-lg-3 mt-3'>
        {openings.map(opening => <OpeningCard key={opening.id} {...opening} />)}
      </div>
    </div>
  )
}

export default OpeningList
