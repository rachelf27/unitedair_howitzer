class TopHeaderSection < Howitzer::Web::Section
  me :id, 'signIn-headerLite-trigger'

  element :sign_in_link, '#dropdown-trigger-text dropdown-trigger-label'
  element :sign_in_button, "[id='btnSignInLink']"
  element :join_now_link, :xpath, "//a[text()='Join now']"

  def sign_in_link
    Howitzer::Log.info 'Sign_in link'
    sign_in_link_element.click
  end

  def dropdown_sign_in_button
    Howitzer::Log.info 'Sign_in button from dropdown'
    sign_in_button_element.click
  end

  def dropdown_join_now
    Howitzer::Log.info 'Join now link from dropdown'
    join_now_link_element.click
  end
end
