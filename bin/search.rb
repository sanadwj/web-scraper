require 'httparty'
require 'nokogiri'
require 'byebug'
require_relative '../lib/country_display'
require_relative '../lib/scraper'


#initialize country class
location = Country.new
puts location.display_country
puts "Please select your choice"
@choice = gets.chomp.to_i


# initilaize Scraper class
scraping = Scraper.new
scraping.country(@choice)
puts "Please enter word"
word = gets.chomp
@array = word.split(" ")
scraping.scraper(@array)
puts scraping.jobs




