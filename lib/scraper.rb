


class Scraper
  attr_writer  :choice, :array
  attr_reader :jobs, :job, :page_num_url, :page, :total
  def initialize
    @titles = []
    @locations = []
    @websites = []
  end

  def country(choice)
    @uri = "https://www.naukrigulf.com/jobs-by-location"
    response = HTTParty.get(@uri)
    parsed_page = Nokogiri::HTML(response.body)
    country_loc = parsed_page.css('div.content')
    @choice = choice
    @countrys = country_loc.css('a')[choice].attributes["href"].value
  end

  def scraper(arr)
    response = HTTParty.get(@countrys)
    parsed_page = Nokogiri::HTML(response.body)
    @jobs = Array.new
    jobs_listing = parsed_page.css('article.aCont')
    @page = 1
    per_page = jobs_listing.count
    @total = parsed_page.css('span.jobsFound')[0].attributes['title'].value.gsub(' ', ' ').to_i
    @last_page = (total.to_f / per_page.to_f).round
    while @page <= @last_page
      @page_num_url = @countrys +"-#{@page}"
      page_num_url_response = HTTParty.get(page_num_url)
      page_num_url_parsed_page = Nokogiri::HTML(page_num_url_response.body)
      jobs_listing = page_num_url_parsed_page.css('article.aCont')
      jobs_listing.each do |job_listing|
        @job = {
            title: job_listing.css('h2.jhead')[0].children[0].text.strip,
            location: job_listing.css('p.locExp')[0].children.text.strip.partition("\n")[2].strip,
            website: job_listing.css('a.improveSearchElem')[0].attributes["href"].value
        }
        if arr.all? { |x| job[:title].downcase.split.include?(x) }
          @titles.push(@job[:title])
          @locations.push(@job[:location])
          @websites.push(@job[:website])
        end
        jobs << job
      end
      @page  += 1
    end
    byebug

  end





end










