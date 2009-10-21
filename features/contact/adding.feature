Feature: Add contacts
  In order to have my contacts online
  As a mobile user
  I want to add my contacts
  
  Scenario: No contacts at all
    Given no contacts
    When I visit contacts_path
    Then I will see an empty table
    And a link add contacts
  Scenario: A new contact
  Scenario: An existing contact
  Scenario: An existing contact with email taken

