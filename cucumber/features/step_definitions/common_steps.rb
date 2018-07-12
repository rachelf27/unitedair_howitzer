#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /^I am in united airlines homepage$/ do
  AppBasePage.open
end

####################################
#              ACTIONS             #
####################################

When /^I click on the top header sign in link$/ do
  AppBasePage.on do
    top_header_section.sign_in_link
  end
end

And /^I choose 'Sign in' feature$/ do
  AppBasePage.on do
    top_header_section.sign_in_button
  end
end

####################################
#              CHECKS              #
####################################



