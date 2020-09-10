require_relative '../lib/country_display'

describe Country do
  let(:country) { Country.new }
  context 'display_country' do
    it 'Display a string of countries' do
      expect(country.display_country.class).to eq(String)
    end
  end
end
