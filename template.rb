require 'mechanize'
require 'csv'

agent = Mechanize.new
base_url = 'https://qiita.com'
page = agent.get(base_url + '/tags/Ruby/items')
elements = page.search('a.u-link-no-underline')

CSV.open('sample.csv', 'w') do |csv|
  csv << %w[title url]

  elements.each do |element|
    path = element.get_attribute('href')
    url = base_url + path
    title = element.inner_text

    csv << [title, url]

    p 'title: ' + title
    p 'url' + url
    p '---------------------------------'
  end
end
