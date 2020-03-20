import React from 'react'
import useFetch from 'hooks/useFetch'

const OpeningRow = ({ opening }) => (
  <tr>
    <td><a href={`/admin/openings/${opening.id}`}>{opening.title}</a></td>
    <td>{opening.company}</td>
    <td>{opening.status}</td>
  </tr>
)

const OpeningList = () => {
  const { isLoading, data: openings } = useFetch('/admin/openings.json')

  return (
    <table className='table'>
      <thead>
        <tr>
          <th scope='col' className='col-5'>Position</th>
          <th scope='col' className='col-5'>Company</th>
          <th scope='col' className='col-2'>Status</th>
        </tr>
      </thead>
      <tbody>
        {
          isLoading ? (
            <tr>
              <td colSpan='2' className='text-center'>
                <div className='spinner-border' />
              </td>
            </tr>
          ) : openings.map(opening => <OpeningRow opening={opening} key={opening.id} />)
        }
      </tbody>
    </table>
  )
}

export default props => <OpeningList {...props} />
