import React, { useState } from 'react'
import { BrowserRouter, StaticRouter, Switch, Route } from 'react-router-dom'
import OpeningList from 'bundles/Public/components/OpeningList'
import Opening from 'bundles/Public/components/Opening'

// `window` is not defined while preprendering
export const isPrerender = typeof window === typeof undefined

const Router = isPrerender
  ? (props) => <StaticRouter {...props} />
  : ({ location, ...props }) => <BrowserRouter {...props} />

const App = ({ context: initialContext, railsContext: { location } }) => {
  const [context] = useState(Object.assign({ openings: [] }, initialContext))
  const Loader = () => <div className='spinner-border' />

  const ConnectedOpening = () =>
    context.opening ? <Opening {...context.opening} /> : <Loader />
  const ConnectedOpeningList = () =>
    context.openings ? <OpeningList openings={context.openings} /> : <Loader />

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
