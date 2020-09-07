class Filewrite
  attr_reader :file
  def initialize(search_arr)
    prefix = 'searches/search-related-to-'
    @file = File.open(prefix + "#{search_arr.join('-')}.html", 'w')
  end

  def build_html
    File.open('template/begin.txt').each do |line|
      @file.puts line
    end
  end

  def classify(list_title, list_ref)
    ph1 = '<h3><a href="'
    ph2 = '"style="color:black;">'
    ph3 = '</a></h3>'
    (0...list_title.length).each do |n|
      @file.puts "#{ph1}#{list_ref[n]}#{ph2}#{list_title[n]}#{ph3}"
    end
  end

  def end_html
    File.open('template/end.txt').each do |line|
      @file.puts line
    end
  end

  def close_file
    @file.close
  end
end