Feature: Test for No Tag
  Background:
  * configure headers = { Accept: 'application/json' }
  * def user =
  """
  {
    "name": "Jatin Bakshi",
    "job": "leader"
  }
  """

#* configure headers = {Content-Type: 'text/xml;charset=ISO-8859-1', Connection: 'Keep-Alive', User-Agent: 'PostmanRuntime/7.31.0'}
* def req_headers = {Authorization: 'Bearer eyJraWQiOiJIRWFIWGtYdDh4MEhZVXZmUE9CZF9tTmNoWThDWmZacTU5UVlFZFFHVlhzIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULm9iMFJDNFdSekExaU1BandTemI1ZU5PT0V2bjhDRGRQZGE2bmZOTWdLYWsiLCJpc3MiOiJodHRwczovL3NlcnZ1cy5va3RhcHJldmlldy5jb20vb2F1dGgyL2F1czFjY24yMzYxakRwS1RzMGg4IiwiYXVkIjoiYXBpOi8vc3RhZmZ2aWV3LWFwaS1kZXYiLCJpYXQiOjE2NzcxMjg4NTcsImV4cCI6MTY3NzEzMjQ1NywiY2lkIjoiMG9hMWN4bWoyMmtaMm5RWjcwaDgiLCJzY3AiOlsicmVhZDphY2NvdW50Il0sInN1YiI6IjBvYTFjeG1qMjJrWjJuUVo3MGg4In0.icCnIP42DN_F_jGfiG98EJA4bvbT_XEEcFfQSREP-8jDkEhSIcd376NYuhzPMIRDxBprh8qHTINJ9jLogwjGQ7hngCCnWDTd6hiE17c4guAGUgZYfLWrzUjtzpzsVcGdKr0p4vvhaDv2pZc09PhundX056u_5UL_WVvhhkXrkS0-N7pPXuLC-GIQJTwx7lCx07YuHG4y24VPBKAdOIQwhQiRRU9ZC2X8z5XQYIn3Ij8SGgtR1uP2MlNZZj5uwC8TxZWn-zaHmZ7qGCJWKi-nf_snSYZOJJb60iGEs0piyRmPGRi_MmmIRTrvV1WpqJa5B1hoyN4fh8UCxdfQN1inrA', Postman-Token: 'eyJraWQiOiJIRWFIWGtYdDh4MEhZVXZmUE9CZF9tTmNoWThDWmZacTU5UVlFZFFHVlhzIiwiYWxnIjoiUlMyNTYifQ.eyJ2ZXIiOjEsImp0aSI6IkFULk5lcHFEQXl2NE16NnFBTVduRWZYdkhmVGhnTGRMWVQtNnMyQ2lNUVJiOEUiLCJpc3MiOiJodHRwczovL3NlcnZ1cy5va3RhcHJldmlldy5jb20vb2F1dGgyL2F1czFjY24yMzYxakRwS1RzMGg4IiwiYXVkIjoiYXBpOi8vc3RhZmZ2aWV3LWFwaS1kZXYiLCJpYXQiOjE2NzcxMzI1ODMsImV4cCI6MTY3NzEzNjE4MywiY2lkIjoiMG9hMWN4bWoyMmtaMm5RWjcwaDgiLCJzY3AiOlsicmVhZDphY2NvdW50Il0sInN1YiI6IjBvYTFjeG1qMjJrWjJuUVo3MGg4In0.eOespZrYkzjJk4GhSDBnDUG8ruOD1W58fpsI5hsiW3YZdyiTNT09m95QyFpv5eO4K5D7E2sKxw8gh-Z7yczMXWNSm4Nlqf3sEzlp8MT_8BTYn4vxn48EBPs-3Gd6Xyni33uBH6xvvs2_BfEec9GjuZbB2NSy1R4cFnEuuWmYbUIajbeDKW0wvNLn-5TJnj2mqbvRua1RvzboQP1Yexmq-3qzygdNHXRvpuYhP6ZCHmqQ1zof_VSYZVUdvA5mU04gjNtZSyTdok7OMm2usuGwl8MIsU3ZZJLaDoH0rBjH8WNW7Il0R1Eo2imdPYHKJJwZvRKqpU6Ksc-uSZbMT37hMQ'}
  
  Scenario: Get Accounts

		Given headers req_headers
    Given url 'https://ccsistaffview-api.dev.prv:955/accounts/2512'
    #And * def body =read("data.
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response

  Scenario: Get Details w/o real time
  	Given headers req_headers
    Given url 'https://ccsistaffview-api.dev.prv:955/account/5900001228827406/detail?resolution=1'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response

  Scenario: Get Details w/real time
    Given url 'https://ccsistaffview-api.dev.prv:955/account/5900001228827406/detail?resolution=2'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response


  Scenario: Get Transaction
    Given url 'https://ccsistaffview-api.dev.prv:955/account/5500003368564098/transactions'
    #And request user
    When method GET
    Then status 200
    * print 'response: is', response

  Scenario: Get healthcheck
    Given url 'https://ccsistaffview-api.dev.prv:955/account/healthcheck'
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