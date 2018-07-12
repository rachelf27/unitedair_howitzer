require 'spec_helper'

feature 'sign in', attribute: :secure do
  background(:each) do
    AppBasePage.open
  end

  scenario 'using a valid number and password' do
    SignInPage.on { sign_in}
  end

   scenario 'using a valid number and password with remember me untoggled' do
     SignInPage.on do
       set_mileageplus_number(Howitzer.app_mileage_number)
       set_mileageplus_password(Howitzer.app_mileage_pass)
       remember_me_element.click
       sign_in_element.click
     end
   end
end
