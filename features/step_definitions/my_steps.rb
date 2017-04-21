#Login

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

