# rubocop : disable Layout/LineLength

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# rubocop : disable Lint/ParenthesesAsGroupedExpression

=======
>>>>>>> a946ffc... Fix linters
=======
# rubocop : disable Lint/ParenthesesAsGroupedExpression

>>>>>>> d706a2a... Fix linters
=======
# rubocop : disable Lint/ParenthesesAsGroupedExpression

>>>>>>> 4e2f737caa84d81790c1287381a6587d1bfe3ba0
require_relative '../lib/scraper'

describe Scraper do
  let (:input) { Scraper.new }
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
  end
end

# rubocop : enable Layout/LineLength
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

# rubocop : enable Lint/ParenthesesAsGroupedExpression
=======
>>>>>>> a946ffc... Fix linters
=======

# rubocop : enable Lint/ParenthesesAsGroupedExpression
>>>>>>> d706a2a... Fix linters
=======

# rubocop : enable Lint/ParenthesesAsGroupedExpression
>>>>>>> 4e2f737caa84d81790c1287381a6587d1bfe3ba0
