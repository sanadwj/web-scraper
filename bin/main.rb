#!/usr/bin/env ruby

# rubocop : disable Layout/LineLength

require 'httparty'
require 'nokogiri'
require 'byebug'
require_relative '../lib/country_display'
require_relative '../lib/scraper'
require_relative '../lib/searches'

# initialize country class
location = Country.new
puts location.display_country
puts
puts 'Please select your choice From the countries listed above :'
@choice = gets.chomp.to_i
while @choice >= 44 || @choice < 1 || @choice.nil?
  puts 'Wrong entry, please choose again :'
  @choice = gets.chomp.to_i
end

# initialize Scraper class
puts 'Enter position separated by space :'
word = gets.chomp
while word.empty?
  puts 'Try again invalid input :'
  word = gets.chomp
end
puts 'Please be patient it could take up to 20 min depend on the country vacancies'
puts 'Searching . . .'
@array = word.split(' ')
scraping = Scraper.new
scraping.country(@choice)
scraping.scraper(@array)

# initialize Searches class
save = Searches.new(@array)
save.start_html
save.store(scraping.titles, scraping.company, scraping.experience, scraping.locations, scraping.requirements, scraping.websites)
save.end_html
save.close_file

puts "Jobs found for the position #{@array.join(' ')} is #{scraping.titles.count}"
puts 'You can find a visual file of your search information in :'
puts "jobs/job_listing_for_#{@array.join('_')}"

# rubocop : enable Layout/LineLength
