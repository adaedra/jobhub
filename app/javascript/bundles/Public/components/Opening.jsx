import React from 'react'
import { Link } from 'react-router-dom'
import { FormattedMessage } from 'react-intl'

const Opening = props => {
  const { title, company, description } = props

  return (
    <div className='p-4 container-md'>
      <Link to='/openings'>
        <FormattedMessage id='views.public.show.back' />
      </Link>

      <div className='jumbotron'>
        <h1>{title}</h1>
        <p className='lead'>{company}</p>
      </div>
      <div>
        {description}
      </div>
      <hr />
      <div className='text-muted text-center'>
        <FormattedMessage id='views.public.show.footer' />
      </div>
    </div>
  )
}

export default Opening
