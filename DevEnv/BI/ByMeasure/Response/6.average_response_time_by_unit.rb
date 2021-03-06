require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"



class LoginToResponseByUnit< Test::Unit::TestCase

def setup
    @driver = Selenium::WebDriver.for :chrome, :switches => %w[--test-type]
    @base_url = "https://devdb5.esosuite.net/EsoSuiteHotfixDaily/"
    @accept_next_alert = true
    @verification_errors = []
  end
  
def wait_for(seconds=30)
  Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
end
  
  def displayed?(how, what)
  @driver.find_element(how, what).displayed?
end

def find_visible_element(how, what)
	 elems = @driver.find_elements(how, what).select { |e| e.displayed? }
	 len = elems.length
		 if len == 0
		  raise "No matches found."
		 elsif len > 1
	  raise "Ambiguous match. Found #{len} matches."
	 end
	 elems.first
end
  
  def teardown
    assert_equal [], @verification_errors
    @driver.quit
  end
  
  
  def test_login_to_Response_by_unit
    @driver.get(@base_url)
    @driver.find_element(:id, "UserName").clear
    @driver.find_element(:id, "UserName").send_keys "admin"
    @driver.find_element(:id, "Password").clear
    @driver.find_element(:id, "Password").send_keys ".admin77."
    @driver.find_element(:id, "AgencyLoginId").clear
    @driver.find_element(:id, "AgencyLoginId").send_keys "bi"
    @driver.find_element(:id, "btnLogin").click
    @driver.find_element(:css, "img[alt=\"analytics\"]").click	
	
    wait_for { displayed?(:xpath, "//div[text() = 'ePCR Reports']") }
	@driver.find_element(:xpath, "//div[text() = 'ePCR Reports']").click	
	
    wait_for { displayed?(:xpath, "//div[text() = 'Operational Reports']") }
	@driver.find_element(:xpath, "//div[text() = 'Operational Reports']").click
	
    wait_for { displayed?(:xpath, "//div[text() = 'Average Response Time By Unit']") }
	@driver.find_element(:xpath, "//div[text() = 'Average Response Time By Unit']").click
	
	wait_for { displayed?(:css, "div.label.ng-binding") }
	@driver.find_element(:css, "div.label.ng-binding").click	
	
    wait_for { displayed?(:xpath, "//div[text() = 'Previous Year']") }
	@driver.find_element(:xpath, "//div[text() = 'Previous Year']").click
	
	wait_for { displayed?(:xpath, "//div[text() = '06:18']") }
	wait_for { displayed?(:xpath, "//div[text() = '73%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '3,903']") }

	wait_for { displayed?(:css, "li > span") }
	@driver.find_element(:css, "li > span").click

	wait_for { displayed?(:xpath, "//div[2]/div/div[3]/div/div") }
	@driver.find_element(:xpath, "//div[2]/div/div[3]/div/div").click

	wait_for { displayed?(:css, "span.k-input") }
    @driver.find_element(:css, "span.k-input").click	

	wait_for { displayed?(:xpath, "//ul[@id='filters-combo-2-1_listbox']/li[12]") }
	@driver.find_element(:xpath, "//ul[@id='filters-combo-2-1_listbox']/li[12]").click

	wait_for { displayed?(:xpath, "//div[2]/span/span/span") }
	@driver.find_element(:xpath, "//div[2]/span/span/span").click

    @driver.find_element(:xpath, "//div[7]/div/ul/li[2]").click
	
	wait_for { displayed?(:xpath, "//td/div/div/div[4]/div/div") }
    @driver.find_element(:xpath, "//td/div/div/div[4]/div/div").click
	wait_for { displayed?(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[10]") }

    @driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[10]").click
    @driver.find_element(:xpath, "//td/div/div/div[4]/div/div").click
    @driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[11]").click
    @driver.find_element(:xpath, "//td/div/div/div[4]/div/div").click
	@driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[12]").click
    @driver.find_element(:xpath, "//td/div/div/div[4]/div/div").click
	@driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[13]").click
    @driver.find_element(:xpath, "//td/div/div/div[4]/div/div").click

	@driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li[8]").click	

	wait_for { displayed?(:xpath, "//body/div[4]/div/div[2]/div[3]/button[2]") }	
	@driver.find_element(:xpath, "//body/div[4]/div/div[2]/div[3]/button[2]").click

	wait_for { displayed?(:xpath, "//div[text() = '06:44']") }
	wait_for { displayed?(:xpath, "//div[text() = '69%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '965']") }
	
	@driver.find_element(:xpath, "//td[14]").click

	wait_for { displayed?(:xpath, "//a/span") }
	@driver.find_element(:xpath, "//a/span").click

	wait_for { displayed?(:css, "button.viewPCR") }
    @driver.find_element(:css, "button.viewPCR").click
	@driver.page_source.include? 'EMS'
	@driver.find_element(:xpath, "//div[3]/div/div/div/button").click

	
	wait_for { displayed?(:xpath, "//td[2]/section/footer/button") }
	@driver.find_element(:xpath, "//td[2]/section/footer/button").click
	sleep (3)
	@driver.page_source.include? 'Billing Review'
	sleep (3)
	@driver.find_element(:xpath, "//div[3]/div/div/div/button").click

	
	wait_for { displayed?(:xpath, "//a[contains(text(),'a')]") }
	@driver.find_element(:xpath, "//a[contains(text(),'a')]").click
	
	wait_for { displayed?(:xpath, "//div[text() = '06:44']") }
	wait_for { displayed?(:xpath, "//div[text() = '69%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '965']") }
	
	@driver.find_element(:xpath, "//li[2]/label").click
	@driver.find_element(:xpath, "(//input[@type='text'])[4]").clear
	@driver.find_element(:xpath, "(//input[@type='text'])[4]").send_keys "Average Response Time By Unit -automation"
	@driver.find_element(:xpath, "(//input[@type='text'])[5]").clear
	@driver.find_element(:xpath, "(//input[@type='text'])[5]").send_keys "automated"
	@driver.find_element(:xpath, "//div[6]/div/div/div[4]/div[2]").click
	@driver.find_element(:xpath, "//div[8]/button[3]").click
	
	sleep (2)
	@driver.find_element(:xpath, "//a").click
	wait_for { displayed?(:xpath, "//div[text() = 'Agency Reports']") }
	@driver.find_element(:xpath, "//div[text() = 'Agency Reports']").click
	sleep (2)
	wait_for { displayed?(:xpath, "//div[text() = 'Average Response Time By Unit -automation']") }
	@driver.find_element(:xpath, "//div[text() = 'Average Response Time By Unit -automation']").click	

	wait_for { displayed?(:xpath, "//div[text() = '06:44']") }
	wait_for { displayed?(:xpath, "//div[text() = '69%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '965']") }
	
	wait_for { displayed?(:xpath, "//td[14]") }
	@driver.find_element(:xpath, "//td[14]").click
	wait_for { displayed?(:xpath, "//a[contains(text(),'a')]") }
	@driver.find_element(:xpath, "//a[contains(text(),'a')]").click

	wait_for { displayed?(:xpath, "//div[text() = '06:44']") }
	wait_for { displayed?(:xpath, "//div[text() = '69%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '965']") }
	
	@driver.find_element(:xpath, "//li[4]/label").click
	@driver.find_element(:xpath, "//div[2]/div[8]").click

	@driver.find_element(:xpath, "(//input[@type='text'])[8]").clear
	@driver.find_element(:xpath, "(//input[@type='text'])[8]").send_keys "25"
	
	@driver.find_elements(:xpath, "//button")[-1].click

	wait_for { displayed?(:xpath, "//div[text() = '06:44']") }
	wait_for { displayed?(:xpath, "//div[text() = '69%']") }
	wait_for { displayed?(:xpath, "//div[text() = '365']") }
	wait_for { displayed?(:xpath, "//div[text() = '965']") }
	
	sleep (2)
	@driver.find_element(:xpath, "//a").click
	wait_for { displayed?(:xpath, "//div[text() = 'Agency Reports']") }
	@driver.find_element(:xpath, "//div[text() = 'Agency Reports']").click
	sleep (2)
	@driver.find_element(:css, "a.dropdown-toggle").click
	wait_for { displayed?(:link, "Add to Favorites") }
	@driver.find_element(:link, "Add to Favorites").click
	@driver.find_element(:css, "b.caret").click
	wait_for { displayed?(:link, "Remove from Favorites") }
	@driver.find_element(:link, "Remove from Favorites").click
	@driver.find_element(:css, "b.caret").click
	wait_for { displayed?(:link, "Delete Report") }
	@driver.find_element(:link, "Delete Report").click
	@driver.find_elements(:xpath, "//button")[-1].click
	
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
