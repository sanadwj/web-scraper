# frozen_string_literal: true

class Scraper
  attr_writer :choice
  attr_reader :jobs, :job, :total, :page, :titles, :company, :locations, :websites, :experience, :requirements, :response, :parsed_page, :countrys, :user_response, :pagination
  def initialize
    @titles = []
    @company = []
    @experience = []
    @locations = []
    @requirements = []
    @websites = []
  end

  def country(choice)
    @uri = 'https://www.naukrigulf.com/jobs-by-location'
    @response = HTTParty.get(@uri)
    @location_parsed_page = Nokogiri::HTML(@response.body)
    country_loc = @location_parsed_page.css('div.content')
    @choice = choice
    @countrys = country_loc.css('a')[choice].attributes['href'].value
  end

  def scraper(arr)
    @user_response = HTTParty.get(@countrys)
    @parsed_page = Nokogiri::HTML(@user_response.body)
    @jobs = []
    jobs_listing = @parsed_page.css('article.aCont')
    @page = 1
    per_page = jobs_listing.count
    @total = parsed_page.css('span.jobsFound')[0].attributes['title'].value.gsub(' ', ' ').to_i
    @last_page = (total.to_f / per_page.to_f).round
    while @page <= @last_page
      @pagination = @countrys + "-#{@page}"
      pagination_response = HTTParty.get(@pagination)
      pagination_parsed_page = Nokogiri::HTML(pagination_response.body)
      jobs_listing = pagination_parsed_page.css('article.aCont')
      jobs_listing.each do |job_listing|
        @job = {
          title: job_listing.css('h2.jhead')[0].children[0].text.strip,
          company: job_listing.css('span.cName').text,
          exp: job_listing.css('p.locExp')[0].children.text.strip.partition("\n")[0],
          location: job_listing.css('p.locExp')[0].children.text.strip.partition("\n")[2].strip,
          req: job_listing.css('span.keyword')[0].children.text.strip.partition("\n")[0],
          website: job_listing.css('a.improveSearchElem')[0].attributes['href'].value
        }
        if arr.all? { |x| job[:title].downcase.split.include?(x) }
          @titles << (@job[:title])
          @company << (@job[:company])
          @experience << (@job[:exp])
          @locations << (@job[:location])
          @requirements << (@job[:req])
          @websites << (@job[:website])
        end

        jobs << job
      end
      @page += 1

    end
  end
end
