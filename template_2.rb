require 'mechanize'

agent = Mechanize.new
base_url = 'https://qiita.com'
path = '/tags/Ruby/items'

# 次ページのリンクを取得
array = []
5.times do
  break if path.nil?
  array << base_url + path
  page = agent.get(base_url + path)
  element = page.search('a.js-next-page-link')
  path = element.first.get_attribute('href')
end

# ページ内のタイトルを取得
array.each do |a|
  page = agent.get(a)
  elements = page.search('a.u-link-no-underline')

  elements.each do |element|
    title = element.inner_text
    p title
  end

  p '---------------------'
end
