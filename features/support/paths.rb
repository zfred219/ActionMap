# frozen_string_literal: true

# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
    # Maps a name to a path. Used by the
    #
    #   When /^I go to (.+)$/ do |page_name|
    #
    # step definition in web_steps.rb
    #
    def path_to(page_name)
        case page_name
        when /^the login page$/
            '/login'
        when /^the map page$/
            root_path # NOTICE HOW THIS DEFINED
        when /^the user profile page$/
            user_profile_path
        when /^the state map page of "(.*)"$/
            "/state/#{Regexp.last_match(1)}"
        else
            path_to_two(page_name)
        end
    end

    def path_to_two(page_name)
        case page_name
        when /^the representatives page$/
            '/representatives'
        when /^the representatives list page$/
            search_representatives_path
        when /^the events page$/
            '/events'
        when /^the Representatives page$/
            '/representatives'
        else
            path_to_three(page_name)
        end
    end

    def path_to_three(page_name)
        case page_name
        when /^the Login page$/
            '/login'
        when /^the Events page$/
            '/events'
        when /^Add New Event$/
            'my_events/new'
        when /search page/i
            search_representatives_path
        end
    end
end

World(NavigationHelpers)
