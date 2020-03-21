// This file is used by Rails for server-side prerendering.
import ReactOnRails from 'react-on-rails'
import LoginForm from 'bundles/Login/components/LoginForm'
import App from 'bundles/Public/App'

ReactOnRails.register({ LoginForm, App })
