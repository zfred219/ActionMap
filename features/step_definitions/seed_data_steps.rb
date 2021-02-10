# frozen_string_literal: true

require_relative '../../db/seed_data'

Given(/all the states exist/) do
    SeedData.states.each { |state| State.create state }
end

Given(/all counties exist/) do
    SeedData.states.each do |state|
        state = State.find_by(symbol: state[:symbol])
        county_filename = "lib/assets/counties_fips_data/#{state[:symbol].downcase}.json"
        File.open(Rails.root.join(county_filename), 'r:UTF-8') do |f|
            state.counties = JSON.parse(f.read, object_class: County)
        end
        state.save
    end
end

Given(/all events exist/) do
    step %("all the states exist")
    step %("all counties exist")
    state = State.find_by(symbol: event[:state_symbol])
    county = County.find_by(state_id: state.id, fips_code: event[:fips_code])
    Event.create(
        name:        event[:name],
        description: event[:description],
        county:      county,
        start_time:  event[:start_time],
        end_time:    event[:end_time]
    )
end
