# frozen_string_literal: true

Given(/the following representatives exist/) do |representatives_table|
    representatives_table.hashes.each do |representative|
        Representative.create representative
    end
end

Then('I should see flash {string}') do |_alert_msg|
    #     expect(flash[:notice]).to be_present
    page.should have_css('.flashnotice', text: 'Message was successfully sent')
end
