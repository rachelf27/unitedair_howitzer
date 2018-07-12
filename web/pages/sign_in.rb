# frozen_string_literal: true
# page objects and methods on the sign_in page
require_relative 'app_base_page'

class SignInPage < AppBasePage
  path 'account/account/signin'

  validate :url, %r{account/account/signin}

  element :number,    "[name='MpNumber']"
  element :password,    "[name='Password']"
  element :sign_in,     "[id='btnSignIn']"
  element :remember_me, "[name='RememberMe']"
  element :field_validation_header_message, '#errorMessageHeading'
  element :field_validation_error, '#field-validation-error'

  # happy path to set number and password in one function
  def sign_in
    number_element.set Howitzer.app_mileage_number
    password_element.set Howitzer.app_mileage_pass
    sign_in_element.click
  end

  def set_mileageplus_number(number)
    number_element.set number
  end

  def set_mileageplus_password(password)
    password_element.set password
  end

  def click_sign_in
    sign_in_element.click
  end

  def click_remember_me
    Howitzer::Log.info " Click 'Remember Me'"
    remember_me_element.click
  end

  # CHECKS

  def field_validation_message
    field_validation_header_message.text
  end

  def field_validation_error
    field_validation_error.text
  end
end
