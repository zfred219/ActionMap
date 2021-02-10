# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

states_table = [{ name:         'California',
                  symbol:       'CA',
                  fips_code:    '006',
                  is_territory: 0,
                  lat_min:      -124.409591,
                  lat_max:      -114.131211,
                  long_min:     32.534156,
                  long_max:     -114.131211 }]

events_table = [{ name:         'Pride Parade',
                  description:  'test',
                  fips_code:    '0001',
                  start_time:   '2100-01-01',
                  end_time:     '2100-01-02',
                  state_symbol: 'CA' }]

RSpec.describe AjaxController, type: :controller do
    before :each do
        states_table.each do |state|
            State.create state
        end
        State.all.each do |state|
            county_filename = "lib/assets/counties_fips_data/#{state[:symbol].downcase}.json"
            File.open(Rails.root.join(county_filename), 'r:UTF-8') do |f|
                state.counties = JSON.parse(f.read, object_class: County)
            end
        end

        events_table.each do |event|
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

    it 'should have correct http status code' do
        get :counties, params: { state_symbol: 'CA' }
        expect(response).to have_http_status(200)
    end
end
