assert = require 'assert'
test = require 'selenium-webdriver/testing'
webdriver = require 'selenium-webdriver'


test.describe 'Adslot website', ->

  # Browser (or driver) instance
  browser = null

  # Init browser before we begin
  # Could not use default Chrome Browser as it was throwing some ransom errors and could spend time to investigate the issues
  test.before -> browser = new webdriver.Builder().usingServer().withCapabilities({browserName: 'firefox'}).build()

  # Close browser after all tests
  test.after -> browser.quit()



  test.it 'should have 8 offices on careers page', ->

    browser.get 'http://adslot.com/careers'

    browser.findElements(webdriver.By.css('.ui-tabs-nav h4, .ui-tabs-nav h2')).then (menuItems) ->
      assert menuItems.length, 8

    #################################### TEST CASE 2 ###################################################
    ############################## TEST CASES FOR CONTACT US FORM PAGE ######################################
  test.it 'should contain a form on "contact us" page', ->

    browser.get 'http://www.adslot.com/contact-us'

    assert browser.findElement(webdriver.By.id('first_name')).isDisplayed()
    assert browser.findElement(webdriver.By.id('last_name')).isDisplayed()
    assert browser.findElement(webdriver.By.id('message')).isDisplayed()
    assert browser.findElement(webdriver.By.css('button[type=submit]')).isDisplayed()
    assert browser.findElement(webdriver.By.id('00N90000004oGQH')).isDisplayed()
    ## Check for the elements of drop down
    browser.findElements(webdriver.By.id('00N90000004oGQH')).then (Items) ->
      assert Items.length, 3
 
    #################################### TEST CASE 2 END ################################################

        #################################### TEST CASE 3 ###################################################
    ############################## TEST CASES FOR CONTACT US PAGE ######################################
  test.it 'Testing of Other Elements of "contact us" page', ->

    browser.get 'http://www.adslot.com/contact-us'
    
    browser.findElement(webdriver.By.xpath('//div[4]/div[2]/div/div/div[1]/div/div/div/div/div/h2[1]'))
    .isDisplayed()
    ## Check the Text
    assert browser.findElement(webdriver.By.xpath('//div[4]/div[2]/div/div/div[1]/div/div/div/div/div/h2[1]')).getText(),'New to Adslot? Get in contact with our sales team.'

    browser.findElement(webdriver.By.xpath('//div[4]/div[2]/div/div/div[1]/div/div/div/div/div/p[1]'))
    .isDisplayed()
    ## Check the Text
    assert browser.findElement(webdriver.By.xpath('//div[4]/div[2]/div/div/div[1]/div/div/div/div/div/p[1]')).getText(),'Fill out the form below and we�ll be in-touch as soon as possible.'    
    #################################### TEST CASE 3 END ################################################


    #################################### TEST CASE 1 ###################################
    ############################## THIS WILL SEARCH "Adslot" ON GOOGLE #################
  test.it 'Search on "Google" ADSLOT', ->

    browser.get 'https://www.google.com.au'

    browser.findElement(webdriver.By.name('q')). then (input) ->
      input.sendKeys('adslot')
      browser.findElement(webdriver.By.name('btnG')).click()
      browser.wait(webdriver.until.titleIs('adslot - Google Search'), 3000)
      browser.findElement(webdriver.By.linkText('Adslot')).click()
      browser.wait(webdriver.until.titleIs('Adslot'), 3000)
      assert browser.getTitle(),'Adslot'
    ################################### TEST CASE 1 END #################################
