# frozen_string_literal: true

class AddPoliticalDataForReps < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :party, :string
        add_column :representatives, :phones, :string
        add_column :representatives, :emails, :string
        add_column :representatives, :photo, :text
        add_column :representatives, :address, :string, array: true
        add_column :representatives, :street, :string
        add_column :representatives, :zip, :string
        add_column :representatives, :state, :string
        add_column :representatives, :city, :string
    end
end
