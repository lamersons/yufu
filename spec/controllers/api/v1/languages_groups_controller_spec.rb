require 'rails_helper'

RSpec.describe Api::V1::LanguagesGroupsController, :type => :controller do

  describe '#price' do
    let (:languages_group) do
      create :languages_group, verbal_prices: [build(:price_verbal, level: 'guide', value: 100)] do |languages_group|
        languages_group.languages.create name: 'Mumbu-umbu'
      end
    end

    subject{get :price, language_id: languages_group.languages.first.id, level: 'guide', format: :json}

    it 'correct price' do
      subject
      expect(response.body).to eq({price: Price.with_markup(languages_group.verbal_cost('guide'))}.to_json)
    end

  end

end