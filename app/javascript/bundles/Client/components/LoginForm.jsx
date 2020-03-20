import React from 'react'
import { useForm, useField } from 'react-form'

const MailField = React.forwardRef((props, ref) => {
  const { getInputProps } = useField('email', { defaultValue: '' })

  return (
    <label>
      E-mail:&nbsp;
      <input type='email' {...getInputProps({ ref })} />
    </label>
  )
})

const PasswordField = React.forwardRef((props, ref) => {
  const { getInputProps } = useField('password', { defaultValue: '' })

  return (
    <label>
      Password:&nbsp;
      <input type='password' {...getInputProps({ ref })} />
    </label>
  )
})

const LoginForm = () => {
  const { Form, meta: { canSubmit } } = useForm({
    onSubmit: async (values) => {
      const authenticityToken = document.querySelector('meta[name=csrf-token]').content
      const response = await fetch('/users/sign_in', {
        method: 'POST',
        body: JSON.stringify({ user: values }),
        headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': authenticityToken, Accept: 'application/json' }
      })

      console.log(response)
    }
  })

  return (
    <Form>
      <MailField />
      <PasswordField />
      <button disabled={!canSubmit} type='submit'>Log in</button>
    </Form>
  )
}

// react_on_rails seems to have trouble with pure function components and hooks. Workaround to make it work.
// See https://github.com/shakacode/react_on_rails/issues/1198
export default () => <LoginForm />
