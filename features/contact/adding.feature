Feature: Add contacts
  In order to have my contacts online
  As a mobile user
  I want to add my contacts
  
  Scenario: No contacts at all
    Given no contacts
    When I am on contacts page
    Then I should see "Firstname"
    And I should see "Lastname"
    And I should see "Email"
    And I should see "Twitter"
    And I should see "Add a contact" within "a"
  Scenario: A new contact
  Scenario: An existing contact
  Scenario: An existing contact with email taken

