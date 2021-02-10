# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Representative, type: :model do
    # API call is stubbed in spec_helper
    before :each do
        service = Google::Apis::CivicinfoV2::CivicInfoService.new
        service.key = Rails.application.credentials.dig(:GOOGLE_API_KEY)
        @rep_info = service.representative_info_by_address(address: 'California')
        Representative.civic_api_to_representative_params(@rep_info)
    end

    context 'when civic_api_to_representative_params is called' do
        it 'updates the database according to the given response' do
            @trump = Representative.find_by(name: 'Donald J. Trump')
            expect(@trump.title).to eq 'President of the United States'
            expect(@trump.ocdid).to eq 'ocd-division/country:us'
            expect(@trump.city).to eq 'Washington'
        end

        it 'should not create duplicates to the database' do
            Representative.civic_api_to_representative_params(@rep_info)
            @trumps = Representative.where({ name: 'Donald J. Trump' })
            expect(@trumps.length).to eq 1
        end
    end
end
