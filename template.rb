require 'mechanize'

agent = Mechanize.new
base_url = 'https://qiita.com'
page = agent.get(base_url + '/tags/Ruby/items')
elements = page.search('a.u-link-no-underline')

elements.each do |element|
  path = element.get_attribute('href')
  url = base_url + path
  title = element.inner_text

  p 'title: ' + title
  p 'url' + url
  p '---------------------------------'
end
