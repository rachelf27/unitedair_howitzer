# frozen_string_literal: true
# page objects that are common to all pages
class AppBasePage < Howitzer::Web::Page
  include RSpec::Wait

  section :breadcrumbs_header
  section :left_navbar
  section :entity_switcher_panel
  section :entity_switcher
  section :dataset

  element :portal_status,       '.portal-status'
  element :loading,             '.ui-loading'

  def visit_entity(name)
    visit "#{Howitzer.app_uri}/portal/#{name}/visitor_analytics"
  end

  def visit_entity_control_panel(entity_name)
    visit "#{Howitzer.app_uri}/controlpanel#/#{entity_name}/manage/settings"
  end

  def waiting_on(seconds = 30)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def scroll_to(element)
    script = 'arguments[0].scrollIntoView(true);'
    Capybara.current_session.driver.browser.execute_script(script, element.native)
  end
end
