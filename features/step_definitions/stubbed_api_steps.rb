# frozen_string_literal: true

Given(/^the API call is stubbed$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'a.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    uri = ur + 'address=Alameda%20County,%20CA&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to California$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'california.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=California'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to Cal$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'cal.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=Cal'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to Alameda$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'alameda.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=Alameda'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to New York$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'newyork.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=New%20York'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to Florida$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'florida.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=Florida'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to ASVYTSUDGIWBUVWIGCUBW$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'ASVY.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=ASVYTSUDGIWBUVWIGCUBW'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 400, body: rep_info, headers: hd)
end

Given(/^the API call is stubbed to New Yok$/) do
    rep_info_json_file = File.join(File.dirname(__FILE__), 'json_responses', 'newyok.json')
    rep_info = File.read(rep_info_json_file)
    ur = 'https://civicinfo.googleapis.com/civicinfo/v2/representatives?'
    add = 'address=New%20Yok'
    key = '&key=AIzaSyD-m8CxEaeaU3UO8y5RL5IqrJRhQxTyb3s'
    uri = ur + add + key
    hd = [['Content-Type', 'application/json; charset=UTF-8']]
    stub_request(:get, uri).to_return(status: 200, body: rep_info, headers: hd)
end
