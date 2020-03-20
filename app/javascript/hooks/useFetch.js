import { useState } from 'react'

const useFetch = url => {
  const [data, setData] = useState(null)
  const [fetchPromise, setFetchPromise] = useState(null)

  if (data === null) {
    if (fetchPromise === null) {
      const promise = fetch(url).then(async response => {
        if (response.status !== 200) { return }

        const data = await response.json()
        setData(data)
        setFetchPromise(null)
      })
      setFetchPromise(promise)
    }

    return { isLoading: true, data: null }
  } else {
    return { isLoading: false, data }
  }
}

export default useFetch
