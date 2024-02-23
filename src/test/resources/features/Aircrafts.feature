Feature: Testing FTB REST API AIRCRAFTS resource
  Clients should be able to READ/CREATE/UPDATE/DELETE an aircraft record.

  Scenario: Get specific aircraft data by its ID
    Given FTB is up and running and the tests are configured
    When client gets details of Aircraft id=12
    Then aircraft data to be manufacturer='Su' and model='Su-24' and number of seats=494

  Scenario: Create an aircraft
    Given FTB is up and running and the tests are configured
    When client tries to create an Aircraft having manufacturer='HAHA' and model='UHU' and number of seats=5
    Then returned aircraft data to be manufacturer='HAHA' and model='UHU' and number of seats=5
    When client gets details of just created Aircraft
    Then aircraft data to be manufacturer='HAHA' and model='UHU' and number of seats=5


    Scenario: Get specific aircraft data by its ID (with NULL in number os seats)
      Given FTB is up and running and the tests are configured
      When client gets details of Aircraft id=1165
      Then aircraft data to be manufacturer='HAHA' and model='UHU' and number of seats=5


  Scenario: Get specific aircraft data by its ID (including null seats)
    Given FTB is up and running and the tests are configured
    When client gets details of Aircraft id=1165
    Then aircraft data to be manufacturer='HAHA' and model='UHU'
    Then number of seats to be null
