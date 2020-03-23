import React from 'react'
import useFetch from 'hooks/useFetch'
import { classNames } from 'bundles/Shared/util'

const EditLink = ({ openingId }) => (
  <li className='nav-item'>
    <a href={`/admin/openings/${openingId}/edit`} className='nav-link'>Edit</a>
  </li>
)

const PublishLink = () => (
  <li className='nav-item'>
    <button className='btn btn-link nav-link'>Publish</button>
  </li>
)

const ArchiveLink = () => (
  <li className='nav-item'>
    <button className='btn btn-link nav-link text-danger'>Archive</button>
  </li>
)

const Opening = () => {
  const { isLoading, data: opening } = useFetch(window.location.pathname.concat('.json'))

  if (isLoading) {
    return <div className='spinner-border' />
  }

  return (
    <>
      <h1>
        {opening.title}&nbsp;
        <span className={classNames('badge', opening.status === 'Active' ? 'badge-success' : 'badge-secondary')}>{opening.status}</span>
      </h1>
      <div className='row mt-3'>
        <div className='col col-lg-9'>
          {opening.description}
        </div>
        <div className='col col-lg-3'>
          <ul className='nav flex-column'>
            <EditLink openingId={opening.id} />
            {opening.status === 'Pending' && <PublishLink />}
            {opening.status === 'Active' && <ArchiveLink />}
          </ul>
        </div>
      </div>
    </>
  )
}

export default props => <Opening {...props} />
