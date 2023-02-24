Feature: Test for No Tag
  Background:
  * def user =
  """
  {
    "name": "Jatin Bakshi",
    "job": "leader"
  }
  """

#* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'PostmanRuntime/7.31.0'}

  Scenario: Get Accounts
    Given url 'http://credit-card-xapi.ca-c1.cloudhub.io/cc-api/accounts/1234'
    #And * def body =read("data.
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response

  Scenario: Get Details w/o real time
    Given url 'https://ccsistaffview-api.dev.prv:955/account/5900001228827406/detail?resolution=1'
    #And request user
    When method GET
    Then status 200
    
    * print 'response: is', response

  Scenario: Get Details w/real time
    Given url 'https://reqres.in/api/users?page=2'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response


  Scenario: Get Transaction
    Given url 'https://reqres.in/api/users?page=2'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response

  Scenario: Get healthcheck
    Given url 'https://reqres.in/api/users?page=2'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response    
    Then assert responseStatus == 200 || responseStatus == 400
		And if (responseStatus == 400) karate.call('SecondfeatureTest.feature')


#    """
#		* match response == '#[1]'
#		And match response.[0].name == 'Jatin Bakshi'
#		And match response.[0].name[*] == 'Bakshi'
#		* match each response == { tagName: 'CaseTag', value: '#string', entityType: 'Case', partitionId: 1, appId: 1, id: '#number', tagId: 1, entityId: 1 }
#		* match each response contains { tagName: 'CaseTag', entityType: 'Case', partitionId: 1, appId: 1, tagId: 1, entityId: 1 }