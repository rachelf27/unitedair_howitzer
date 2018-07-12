require 'spec_helper'

feature 'join', attribute: :secure do
  background(:each) do
    JoinPage.open
  end

  scenario 'using required fields' do
    JoinPage.on do
    end
  end
end
