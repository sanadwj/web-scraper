# rubocop : disable Layout/LineLength

# rubocop : disable Metrics/ParameterLists

class Searches
  attr_reader :file

  def initialize(arr)
    prefix = '../jobs/job_listing_for_'
    @file = File.open(prefix + "#{arr[0]}.html", 'w+')
  end

  def start_html
    File.open('../html/start.txt').each do |line|
      @file.puts line
    end
  end

  def store(title_arr, company_arr, exp_arr, location_arr, req_arr, website_arr)
    h3 = '<h3></h3>'
    line = '------------------------------------------------'
    (0..title_arr.length).each do |x|
      @file.puts "#{h3}#{title_arr[x]}#{h3}#{company_arr[x]}#{h3}#{exp_arr[x]}#{h3}#{location_arr[x]}#{h3}#{req_arr[x]}#{h3}#{website_arr[x]}#{h3}#{line}"
    end
  end

  def end_html
    File.open('../html/end.txt').each do |line|
      @file.puts line
    end
  end

  def close_file
    @file.close
  end
end

# rubocop : enable Layout/LineLength

# rubocop : enable Metrics/ParameterLists
