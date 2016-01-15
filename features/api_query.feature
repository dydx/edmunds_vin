Feature: Consumbers can query for vehicle info by VIN

  Scenario: User querys for vehicle information by VIN
    When I search for 4T1BK1EB6DU05616
    Then I should get back a JSON document
