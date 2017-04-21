driver_path = File.join(File.dirname(__FILE__), "..", "..", "drivers", "chromedriver.exe")

Given(/^I open a browser$/) do
	@browser = Selenium::WebDriver.for :chrome, driver_path: driver_path
	@browser.manage.timeouts.implicit_wait = 15
	@browser.manage.timeouts.page_load = 15
	puts "WebDriver has been created"
end

Then(/^I logn with "([^"]*)" email and "([^"]*)" password$/) do |email, passwd|
	#open link
	url = "http://automationpractice.com/index.php?controller=authentication&back=my-account"
	@browser.get url
	#type into email field
	@browser.find_element(id: 'email').send_keys("marioluigio@mail.com")
	#type into pwd field
	@browser.find_element(id: 'passwd').send_keys("Marioluigio")
	#click to submit
	@browser.find_element(id: 'SubmitLogin').click()
	#output email with pwd
	puts "#{email}" and "#{passwd}"
end

Then(/^I should see "([^"]*)" link$/) do |link|
	puts "#{link}"
	expect(@browser.find_element(:css, '.logout').text).to eq(link)
end