And /^I fill in mileageplus (.*)$/ do |number|
  SignInPage.on { set_mileageplus_number(number) }
end

And /^I fill in the mileageplus (.*)$/ do |password|
  SignInPage.on { set_mileageplus_password(password) }
end

Then /^I click the sign in button$/ do
  SignInPage.on { click_sign_in }
end

Then /^the result should be (.*) on the screen$/ do |_output|
  SignInPage.on do
    field_validation_message if _output.text.include? "The account information you entered is not valid."
    field_validation_error
  end
end

