# frozen_string_literal: true

Given(/the following states exist/) do |states_table|
    states_table.hashes.each do |state|
        State.create state
    end
    State.all.each do |state|
        county_filename = "lib/assets/counties_fips_data/#{state[:symbol].downcase}.json"
        File.open(Rails.root.join(county_filename), 'r:UTF-8') do |f|
            state.counties = JSON.parse(f.read, object_class: County)
        end
    end
end

Given(/the following events exist/) do |events_table|
    events_table.hashes.each do |event|
        state = State.find_by(symbol: event[:state_symbol])
        county = County.find_by(state_id: state.id, fips_code: event[:fips_code])
        Event.create!(
            name:        event[:name],
            description: event[:description],
            county:      county,
            start_time:  event[:start_time],
            end_time:    event[:end_time]
        )
    end
end

And(/filter events with "(.*)" state/) do |state|
    choose('State Only')
    select state, from: 'state'
    # visit events_index_path()
end
