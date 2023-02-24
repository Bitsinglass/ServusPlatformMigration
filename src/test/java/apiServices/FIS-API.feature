Feature: Fetch the user details by delay

  @Video
  Scenario: Test the request with delay

    Given url 'https://fissso-api.dev.prv:955/getcards/sso?partyId=430068'
    When method GET
    Then status 200
    #* def accessToken = response.access_token
		#* header Authorization = 'Bearer ' + token
    
    #  Then print 'response: is', response.[0].name
    #* def accessToken = response.access_token
		#* header Authorization = 'Bearer ' + token
    