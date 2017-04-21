require "selenium-webdriver"
require "rspec"


driver_path = File.join(File.dirname(__FILE__), "..", "..", "drivers", "chromedriver.exe")

Before do
	@browser = Selenium::WebDriver.for :chrome, driver_path: driver_path
	@browser.manage.timeouts.implicit_wait = 15
	@browser.manage.timeouts.page_load = 15
	puts "WebDriver has been created"
end	

After do
	@browser.quit
end