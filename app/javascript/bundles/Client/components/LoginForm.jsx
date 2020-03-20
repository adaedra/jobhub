import React, { useState } from 'react'
import { useForm, useField } from 'react-form'

const MailField = React.forwardRef((props, ref) => {
  const { getInputProps } = useField('email', { defaultValue: '' })

  return (
    <div className='form-group'>
      <label htmlFor='user-email'>E-mail</label>
      <input type='email' className='form-control' id='user-email' {...getInputProps({ ref })} />
    </div>
  )
})

const PasswordField = React.forwardRef((props, ref) => {
  const { getInputProps } = useField('password', { defaultValue: '' })

  return (
    <div className='form-group'>
      <label htmlFor='user-password'>Password</label>
      <input type='password' className='form-control' id='user-password' {...getInputProps({ ref })} />
    </div>
  )
})

const LoginForm = () => {
  const [error, setError] = useState(null)
  const { Form, meta: { canSubmit, isSubmitting } } = useForm({
    onSubmit: async (values, instance) => {
      console.log(instance)
      setError(null)

      const authenticityToken = document.querySelector('meta[name=csrf-token]').content
      const response = await fetch('/users/sign_in', {
        method: 'POST',
        body: JSON.stringify({ user: values }),
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': authenticityToken, Accept: 'application/json' }
      })

      if (response.status === 200) {
        // TODO: Send to the right page
      } else {
        setError('Could not log in')
      }
    }
  })

  return (
    <div className='h-100 row align-items-center justify-content-center'>
      <div className='col col-md-4'>
        <h1>Login to JobHub</h1>
        <div className='card border-secondary'>
          <div className='card-body'>
            {error && <div className='alert alert-danger'>{error}</div>}
            <Form>
              <MailField />
              <PasswordField />
              <div className='d-flex justify-content-end align-items-center'>
                {isSubmitting && <div className='spinner-border mr-3' />}
                <button disabled={!canSubmit} className='btn btn-primary' type='submit'>Log in</button>
              </div>
            </Form>
          </div>
        </div>
      </div>
    </div>
  )
}

// react_on_rails seems to have trouble with pure function components and hooks. Workaround to make it work.
// See https://github.com/shakacode/react_on_rails/issues/1198
export default () => <LoginForm />
