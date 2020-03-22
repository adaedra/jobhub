import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { isPrerender } from 'bundles/Public/prerender'

const Loader = () => (
  <div className='p-3 text-center'>
    <div className='spinner-border' />
  </div>
)

// Convoluted element to fetch data on demand.
// data (object): The data as passed by the page.
// onFetch (function):
//   The function to call to refresh data. It is called when the element is showing data and not already fetching new
//   data.
//   It takes two parameters, the params from the router and the current data associated to the `dataKey`.
//   It returns either `false` if there is no update to apply, or a Promise that will resolve to the new data for
//   the key.
// component (function): A function that takes the data and returns a component with the data injected.
// setData (function): The parent function to update the data.
const DataLoader = ({ initialData, onFetch, component }) => {
  const params = useParams()
  const [data, setData] = useState(initialData)
  const [promise, setPromise] = useState(null)

  useEffect(() => {
    if (!isPrerender && onFetch && !promise) {
      const promise = onFetch(params, data)
      if (!promise) { return }
      setPromise(promise)

      promise.then(newData => {
        setData(newData)
        setPromise(null)
      })
    }
  }, [])

  return data && !promise ? component(data) : <Loader />
}

export default DataLoader
