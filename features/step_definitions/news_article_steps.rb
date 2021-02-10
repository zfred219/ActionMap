# frozen_string_literal: true

When(/I'm on representative list page for Alameda County/) do
    visit('/state/CA/county/001/Alameda%20County,%20CA')
end

Given(/I press the "(.*)" button for first representative/) do |button_name|
    first(:link, button_name).click
end

And(/fill in the information for news article/) do
    fill_in('news_item[title]', with: 'Fake News')
    fill_in('news_item[link]', with: 'https://fakenews.com')
    fill_in('news_item[description]', with: 'Trump flipped California')
    select 'Donald J. Trump', from: 'news_item[representative_id]'
end

Given(/There exist one news article for Donald Trump/) do
    step %(Given I'm on representative list page for Alameda County)
    step %(And I press the "News Article" button for first representative)
    click_link('Add News Article')
    step %(And I fill in the information for news article)
    click_button('Save')
    click_link('View all articles')
end
