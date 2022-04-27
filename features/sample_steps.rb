require 'rubygems'

Given('Text to seach is {string}') do |text_to_search|
  $driver.manage.timeouts.implicit_wait = 5
  $driver.manage.window.maximize

  $driver.get("https://www.flipkart.com")

  popup_elem_xpath = '//button[@class="_2KpZ6l _2doB4z"]'
  popup_elem = $driver.find_element(:xpath, popup_elem_xpath)
  popup_elem.click
  
  searchbox_xpath =  '//input[@class="_3704LK"]'
  $driver.find_element(:xpath, searchbox_xpath).send_keys "#{text_to_search}"
  $driver.action.send_keys(:return).perform
  $driver.find_element(:xpath, searchbox_xpath).clear
end
 
When('Text is searched, where type is {string}') do |type|
  @prod_name = ""
  sleep(2)
  if type=='1'
    prod_xpath = '//div[@class="_4rR01T"]'
    @prod_name = $driver.find_element(:xpath, prod_xpath).text
  else
    prod_xpath = '//div[@class="_2B099V"]/a'
    @prod_name = $driver.find_element(:xpath, prod_xpath).text
  end
end
 
Then('I should get first produce name as {string}') do |expected|
  expect(@prod_name.class).to eq(expected.class)
end
