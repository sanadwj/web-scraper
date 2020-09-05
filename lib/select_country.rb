require 'httparty'
require 'nokogiri'
require 'byebug'

class Country
  attr_accessor :loc, :countrys
  def country
    uri = "https://www.naukrigulf.com/jobs-by-location"
    response = HTTParty.get(uri)
    parsed_page = Nokogiri::HTML(response)
    country_loc = parsed_page.css('div.content')
    puts "Please select your choice"
    choice = gets.chomp.to_i
    @countrys = country_loc.css('a')[choice].attributes["href"].value

  end
end

location = Country.new
location.country


countr = location.countrys
puts "your choice is #{countr}"

