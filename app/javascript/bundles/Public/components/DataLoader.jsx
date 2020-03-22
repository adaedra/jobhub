import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { isPrerender } from 'bundles/Public/prerender'

const Loader = () => (
  <div className='p-3 text-center'>
    <div className='spinner-border' />
  </div>
)

// Convoluted element to fetch data on demand.
// data (object): The current data store
// dataKey (string): The element of data to pass to the child element
// onFetch (function):
//   The function to call to refresh data. It is called when the element is showing data and not already fetching new
//   data.
//   It takes two parameters, the params from the router and the current data associated to the `dataKey`.
//   It returns either `false` if there is no update to apply, or a Promise that will resolve to the new data for
//   the key.
// component (function): A function that takes the data and returns a component with the data injected.
// setData (function): The parent function to update the data.
const DataLoader = ({ data, dataKey, onFetch, component, setData }) => {
  const params = useParams()
  const [promise, setPromise] = useState(null)

  useEffect(() => {
    if (!isPrerender && onFetch && !promise) {
      const promise = onFetch(params, data[dataKey])
      if (!promise) { return }
      setPromise(promise)

      promise.then(newData => {
        setData(Object.assign(data, { [dataKey]: newData }))
        setPromise(null)
      })
    }
  }, [])

  console.log('data', data, promise)
  return data[dataKey] && !promise ? component(data[dataKey]) : <Loader />
}

export default DataLoader
