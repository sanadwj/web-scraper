require 'httparty'
require 'nokogiri'
require 'byebug'
require_relative '../lib/select_country'

class Naikrigulf
  attr_accessor :url , :jobs, :job
  def scraper
    @url = "https://www.naukrigulf.com/jobs-in-fujairah"
    response = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(response)
    jobs_listing = parsed_page.css('article.aCont')
    @jobs = jobs_listing.each do |job_listing|
      @job = {
          title: job_listing.css('h2.jhead')[0].children[0].text.strip,
          location: job_listing.css('p.locExp')[0].children.text.strip.partition("\n")[2].strip,
          website: job_listing.css('a.improveSearchElem')[0].attributes["href"].value
      }

    end


    byebug

  end

end




scraping = Naikrigulf.new
scraping.scraper

puts scraping.job


