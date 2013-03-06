require 'rubygems'
require 'open-uri'
require 'nokogiri'


#抓取v2ex.com的网站信息，包括（注册用户、主题、回复）数量


page = Nokogiri::HTML(open('http://www.v2ex.com', "User-Agent" => "firefox"))


result_array = [];   

page.css('div#Wrapper div.content div#Rightbar div.box').last.css('div.cell').last.css('table').css('tr td').each do |el|
result_array.push(el.text)    
end

puts result_array;

File.open("./result_v2ex", 'a') { |file| file.write(Time.now.getlocal.strftime("%Y-%m-%d") + "," + result_array.join(",") + "\n") };



#抓取ruby-china.org的网站信息，包括（注册用户、主题、回复）数量


page = Nokogiri::HTML(open('http://ruby-china.org/topics', "User-Agent" => "firefox"))


result_array = [];   

page.css('div.totals.box ul li').each do |el|
result_array.push(el.text.scan(/(\d+\.?\d*|\.\d+)/))    
end
	
puts result_array;

File.open("./result_ruby-china", 'a') { |file| file.write(Time.now.getlocal.strftime("%Y-%m-%d") + "," + result_array.join(",") + "\n") };

