import React from 'react'
import { BrowserRouter, StaticRouter, Switch, Route } from 'react-router-dom'
import DataLoader from 'bundles/Public/components/DataLoader'
import OpeningList from 'bundles/Public/components/OpeningList'
import Opening from 'bundles/Public/components/Opening'
import { isPrerender } from 'bundles/Public/prerender'

const fetchOpenings = (_, openings) => {
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

// Use a different component depending on the presence of prerender, so prerender works out of browser (with the
// provided location) and in-browser uses standard router.
const Router = isPrerender
  ? (props) => <StaticRouter {...props} />
  : ({ location, ...props }) => <BrowserRouter {...props} />

const App = ({ context, railsContext: { location } }) => {
  const ConnectedOpening =
    () => <DataLoader initialData={context.opening} onFetch={fetchOpening} component={data => <Opening {...data} />} />
  const ConnectedOpeningList =
    () => <DataLoader initialData={context.openings} onFetch={fetchOpenings} component={data => <OpeningList openings={data} />} />

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
