require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class LoginToChute< Test::Unit::TestCase

def setup
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "https://devdb5.esosuite.net/EsoSuiteHotfixDaily/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    assert_equal [], @verification_errors
    @driver.quit
  end
  
	puts " "
	puts "********************************************************************************************************"
	puts "Executing Test: Login to Average Chute Time Report " 
	puts "********************************************************************************************************"

 
  def test_login_to_chute
    @driver.get(@base_url)
    assert_equal "ESO Solutions :: NextGen", @driver.title
    @driver.find_element(:id, "UserName").clear
    @driver.find_element(:id, "UserName").send_keys "admin"
    @driver.find_element(:id, "Password").clear
    @driver.find_element(:id, "Password").send_keys ".admin77."
    @driver.find_element(:id, "AgencyLoginId").clear
    @driver.find_element(:id, "AgencyLoginId").send_keys "bi"
    @driver.find_element(:id, "btnLogin").click
    @driver.find_element(:css, "img[alt=\"analytics\"]").click
    sleep (4)
	puts time1 = Time.now.getutc
    @driver.find_element(:xpath, "//div[text() = 'ePCR Reports']").click
    sleep (4)
	puts time2 = Time.now.getutc
    @driver.find_element(:xpath, "//div[text() = 'Operational Reports']").click
    sleep (4)
    time3 = Time.now.getutc
	@driver.find_element(:xpath, "//div[text() = 'Average Chute Time']").click


	
	puts " "
	puts "********************************************************************************************************"
	time4 = (time3-time2)
	puts "Load Time: Average Chute Time: "+ time4.to_s
	puts "********************************************************************************************************"
	puts " "
	puts " "
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
