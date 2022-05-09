require 'selenium/webdriver'
require 'capybara/cucumber'
require 'browserstack/local'
require 'rubygems'
require 'yaml'

# read config file
CONFIG = YAML.load_file('./config.yml')
url = "http://#{CONFIG['BS_USERNAME']}:#{CONFIG['BS_AUTHKEY']}@hub.browserstack.com/wd/hub"

caps = Selenium::WebDriver::Remote::Capabilities.new
caps['browser'] = 'Chrome'
caps['os_version'] = '10'
caps['resolution'] = '1920x1080'
caps['os'] = 'Windows'
caps['browser_version'] = 'latest'
caps['javascriptEnabled'] = 'true'
caps['name'] = 'Flipkart Automation'
caps['build'] = 'BStack Build Flipkart'
$driver = Selenium::WebDriver.for(:remote,
  :url => url,
  :desired_capabilities => caps)