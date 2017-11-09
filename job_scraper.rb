require 'httparty'
require 'nokogiri'

def space
  puts ""
end

def job_lister(choice)
  url = "https://miami.craigslist.org/search/#{choice}"
  response = HTTParty.get(url)
  html = response.body
  dom = Nokogiri::HTML(html)
  links = dom.css("a.hdrlnk")

  i = 1 
  while i < links.length
    links.each do |link|
      puts "#{i} #{link.to_str}",
      "Link: #{link["href"]}",
      ""
      i += 1
    end
  end
end

def selection
  puts "Welcome to WynCraigslist",
  "",
  "Please select your job postings",
  "",
  "1. Software",
  "2. Marketing",
  "3. Technology",
  "4. Web Design"
end

def assign_choice (choice)
 if choice == "1"
  choice = "sof"
 elsif choice == "2"
  choice = "mar"
 elsif choice == "3"
  choice = "tch"
 elsif choice == "4"
  choice = "web"
 else
 puts "That's not available, try again." 
end
choice
end


loop do

  space

  selection

  choice = gets.chomp.downcase

  page = assign_choice(choice)

  job_lister(page)

  puts "Would you like to see another selection?"

end