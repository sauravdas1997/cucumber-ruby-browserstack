require 'rubygems'

URL = 'https://www.flipkart.com'
PROD_XPATH1 = '//div[@class="_4rR01T"]'
PROD_XPATH2 = '//div[@class="_2B099V"]/a'
SEARCHBOX_XPATH = '//input[@class="_3704LK"]'
POPUP_ELEM_XPATH = '//button[@class="_2KpZ6l _2doB4z"]'

Given('Text to seach is {string}') do |text_to_search|
  $driver.manage.timeouts.implicit_wait = 5
  $driver.manage.window.maximize

  $driver.get(URL)

  popup_elem = $driver.find_element(:xpath, POPUP_ELEM_XPATH)
  popup_elem.click

  $driver.find_element(:xpath, SEARCHBOX_XPATH).send_keys text_to_search.to_s
  $driver.action.send_keys(:return).perform
  $driver.find_element(:xpath, SEARCHBOX_XPATH).clear
end

When('Text is searched, where type is {string}') do |type|
  @prod_name = ''
  sleep(2)
  @prod_name = if type == '1'
                 $driver.find_element(:xpath, PROD_XPATH1).text
               else
                 $driver.find_element(:xpath, PROD_XPATH2).text
               end
end

Then('I should get first produce name as {string}') do |expected|
  expect(@prod_name.class).to eq(expected.class)
  $driver.quit
end
