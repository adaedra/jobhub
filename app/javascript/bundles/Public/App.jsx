import React, { useState } from 'react'
import { BrowserRouter, StaticRouter, Switch, Route } from 'react-router-dom'
import DataLoader from 'bundles/Public/components/DataLoader'
import OpeningList from 'bundles/Public/components/OpeningList'
import Opening from 'bundles/Public/components/Opening'
import { isPrerender } from 'bundles/Public/prerender'

const fetchOpenings = (_, openings) => {
  console.log('fetchOpenings', openings)
  if (openings) { return false }

  return fetch('/openings.json')
    .then(response => response.json())
}

const fetchOpening = ({ id }, opening) => {
  if (opening && opening.id.toString() === id) {
    // We already have the right data, cancel
    return false
  }

  return fetch(`/openings/${id}.json`)
    .then(response => response.json())
}

const Router = isPrerender
  ? (props) => <StaticRouter {...props} />
  : ({ location, ...props }) => <BrowserRouter {...props} />

const App = ({ context: initialContext, railsContext: { location } }) => {
  const [context, setContext] = useState(initialContext)

  const ConnectedOpening =
    () => <DataLoader data={context} setData={setContext} dataKey='opening' onFetch={fetchOpening} component={data => <Opening {...data} />} />
  const ConnectedOpeningList =
    () => <DataLoader data={context} setData={setContext} dataKey='openings' onFetch={fetchOpenings} component={data => <OpeningList openings={data} />} />

  return (
    <Router location={location}>
      <Switch>
        <Route path='/openings/:id' component={ConnectedOpening} />
        <Route path='/openings' component={ConnectedOpeningList} />
      </Switch>
    </Router>
  )
}

export default (props, railsContext) => <App {...props} railsContext={railsContext} />
