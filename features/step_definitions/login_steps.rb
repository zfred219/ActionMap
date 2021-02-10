# frozen_string_literal: true

When(/^(?:|I )am logged in$/) do
    step %(I am on the login page)
    step %(I follow "Sign in with Google")
end

When(/^(?:|I )am not logged in$/) do
    step %(I am on the map page)
end
