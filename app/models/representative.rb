# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp, title_temp = title_finder(rep_info, index)

            params = official_parser(official, title_temp, ocdid_temp)

            rep = Representative.where({ name: official.name, title: title_temp }).limit(1).take
            if rep.nil?
                rep = Representative.create!(params)
                # rep is an application record object.
                rep.save
            end
            reps.push(rep)
        end
        reps
    end

    def self.title_finder(rep_info, index)
        ocdid_temp, title_temp = ''
        rep_info.offices.each do |office|
            if office.official_indices.include? index
                title_temp = office.name
                ocdid_temp = office.division_id
            end
        end
        [ocdid_temp, title_temp]
    end

    def self.official_parser(official, title, ocdid)
        addr = address_parser(official)
        party = official.party unless official.party.nil?
        phone = ''
        official.phones&.each do |p|
            phone += p + ' '
        end
        photo = official.photo_url

        { name:   official.name, ocdid: ocdid, title: title, city: addr[:city],
          street: addr[:street], state: addr[:state], zip: addr[:zip], party: party,
          phones: phone, photo: photo }
    end

    def self.address_parser(official)
        if official.address.nil?
            city = ' '
            street = ' '
            state = ' '
            zip = ' '
        else
            official.address&.each do |a|
                city = a.city
                street = a.line1
                state = a.state
                zip = a.zip
            end
        end

        { city: city, street: street, state: state, zip: zip }
    end
end
