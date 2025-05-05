Feature: Flight Search and Booking

  Scenario: Search for available flights from Bandar Abbas to Tehran
    Given I am on the flight booking website
    When I search for flights from "Bandar Abbas" to "Tehran" on "2025-06-15"
    Then I should see a list of available flights

  Scenario: Enter valid passenger information and proceed to payment
    Given I have selected a flight
    When I enter valid passenger details
    Then I should proceed to the payment page

  Scenario: Enter invalid national ID
    Given I have selected a flight
    When I enter "abc123" as national ID
    Then I should see an error message indicating an invalid national ID

  Scenario: Search for flights on a date with no available flights
    Given I am on the flight booking website
    When I search for flights from "Bandar Abbas" to "Tehran" on "2025-01-01"
    Then I should see a message saying no flights are available

  Scenario: Search for flights for Tehran to Bandar Abbas after searching Bandar Abbas to Tehran
    Given I am on the flight booking website
    And searched for Bandar Abbas to Tehran
    When I search for flights from "Tehran" to "Bandar Abbas" on "2025-06-20"
    Then I should see correct available flights and be able to proceed
