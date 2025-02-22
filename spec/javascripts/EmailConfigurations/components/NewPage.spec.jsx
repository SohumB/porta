// @flow

import React from 'react'
import { mount } from 'enzyme'

import { NewPage } from 'EmailConfigurations/components/NewPage'

const defaultProps = {
  emailConfiguration: {
    email: '',
    userName: '',
    password: ''
  },
  url: 'p/admin/email_configurations'
}

const mountWrapper = (props) => mount(<NewPage {...{ ...defaultProps, ...props }} />)

it('should render a form', () => {
  const wrapper = mountWrapper()
  expect(wrapper.find('EmailConfigurationForm').exists()).toEqual(true)
})

it('should render submit button disabled', () => {
  const wrapper = mountWrapper()
  const submitButton = wrapper.find('.pf-c-button.pf-m-primary[type="submit"]')

  expect(submitButton.exists()).toBe(true)
  expect(submitButton.props().disabled).toBe(true)
})
