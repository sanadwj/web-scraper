# rubocop : disable Layout/LineLength

require_relative '../lib/scraper'

describe Scraper do
  let(:input) { Scraper.new }
  context 'initialize' do
    it 'Initialize empty arrays' do
      expect(input.titles.empty? && input.experience.empty? && input.locations.empty? && input.requirements.empty? && input.websites.empty? && input.company.empty?).to eq(true)
    end
  end

  context 'country' do
    it 'Initialize the website ' do
      expect(input.response).to eq(@uri)
    end
    it 'Take the user choice for the country' do
      expect(input.countrys).to eq(@choice)
    end
    it 'Return false if the user input not exist' do
      expect(input.nil?).to eq(false)
    end
    it 'Return false if the user input bigen 44 and less than 1' do
      expect(input.countrys == 100).to eq(false)
    end
  end

  context 'scraper' do
    it 'initialize user input website ' do
      expect(input.response).to eq(@countrys)
    end
    it 'parse the user input website' do
      expect(input.parsed_page).to eq(@user_response)
    end
    it 'Start pagination over the contry page' do
      expect(input.pagination).to eq(@countrys)
    end
    it 'Return false if the user input not exist' do
      expect(input.nil?).to eq(false)
    end
  end
end

# rubocop : enable Layout/LineLength
