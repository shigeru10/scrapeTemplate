require 'mechanize'

agent = Mechanize.new
page = agent.get('http://....')
elements = page.search('div.sample')

elements.each do |element|
  title = element.inner_text
  p title
end
