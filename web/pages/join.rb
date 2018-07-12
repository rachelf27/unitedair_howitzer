# frozen_string_literal: true
# page objects and methods on the join member page
require_relative 'app_base_page'

class JoinPage < AppBasePage
  path 'account/enroll/default'

  validate :url, %r{account/enroll/default}

  element :title,    "[name='Title']"
  element :first_name,    "[name='FirstName']"
  element :middle_name,    "[name='MiddleName']"
  element :last_name,    "[name='LastName']"
  element :suffix,    "[name='Suffix']"
  element :birth_month,    "[id='DOB_BirthMonth']"
  element :birth_date,    "[id='DOB_BirthDay']"
  element :birth_year,    "[id='DOB_BirthYear']"
  element :gender,    "[name='Gender']"
  element :address_code,    "[name='Password']"
  element :street_address,    "[name='Password']"
  element :add_address_line,    "[name='Password']"
  element :city,    "[name='Password']"
  element :state,    "[name='Password']"
  element :zip,    "[name='Password']"
  element :country,    "[name='Password']"
  element :phone,    "[name='Password']"
  element :sms_notifications,    "[name='Password']"
  element :business_phone,    "[name='Password']"
  element :home_airport,    "[name='Password']"
  element :email,    "[name='Password']"
  element :verify_email,    "[name='Password']"
  element :email_updates,    "[name='Password']"
  element :email_subscriptions,    "[name='Password']"
  element :password,    "[name='Password']"
  element :verify_password,    "[name='Password']"
  element :security_question1,    "[name='Password']"
  element :security_answer1,    "[name='Password']"
  element :security_question2,    "[name='Password']"
  element :security_answer2,    "[name='Password']"
  element :security_question3,    "[name='Password']"
  element :security_answer3,    "[name='Password']"
  element :security_question4,    "[name='Password']"
  element :security_answer4,    "[name='Password']"
  element :security_question5,    "[name='Password']"
  element :security_answer5,    "[name='Password']"

  element :enroll,     "[id='btnSignIn']"
  element :cancel, "[name='RememberMe']"

  def sign_in
    add_cookie
    number_element.set Howitzer.app_mileage_number
    password_element.set Howitzer.app_mileage_pass
    sign_in_element.click
  end

  def login_as_secondary_admin
    username_element.set Howitzer.app_secondary_admin_user
    password_element.set Howitzer.app_secondary_admin_pass
    sign_in_element.click
  end

  def login_as_entity_user
    add_cookie
    username_element.set Howitzer.app_entity_user
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  def login_as_entity_admin
    add_cookie
    username_element.set Howitzer.app_entity_admin
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  def login_as_entity_admin_two
    add_cookie
    username_element.set Howitzer.app_entity_admin_two
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  def login_as_not_a_user
    add_cookie
    username_element.set Howitzer.app_not_a_user
    password_element.set Howitzer.app_not_a_user_pass
    sign_in_element.click
  end

  def login_as_unpromoted_user
    add_cookie
    username_element.set Howitzer.app_unpromoted_user
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  def click_remember_me
    Howitzer::Log.info " Click 'Remember Me'"
    remember_me_element.click
  end

  def login_as_entity_partner
    add_cookie
    username_element.set Howitzer.app_entity_partner
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  # CHECKS

  def whoops_message
    whoops_element.text
  end

  def login_as(role)
    add_cookie
    og_role = 'app_' + FuzzyMatch.new(ROLE_MATCHES).find(role)
    config = YAML.load_file File.absolute_path('../cucumber/config/default.yml').to_s
    username_element.set config[og_role]
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
  end

  def login(username)
    add_cookie
    username_element.set username
    password_element.set Howitzer.app_admin_pass
    sign_in_element.click
    execute_script("document.getElementById('intercom-launcher').style.display='none'") unless
        has_no_intercom_launcher_element?
  end

  def add_cookie
    # are we using selenium or poltergeist
    driver = capybara_context.driver
    if defined? driver.browser.manage
      # we are using selenium
      begin
        driver.browser.manage.add_cookie name: 'reports_visited', value: 'true'
      rescue
      end
    else
      # we are using poltergeist
      driver.set_cookie 'reports_visited', 'true'
    end
    # if we want to use phantomjs, add it to the conditional
  end
end
