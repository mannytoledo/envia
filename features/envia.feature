Feature: Envia
  In order to upload or share a link to a file
  As a CLI
  I want to do both from the command line

  Scenario: Help on use is needed
    When I run `envia help`
    Then the output should contain "Describe available commands"

  Scenario: Upload a new file
    When I run `envia upload`
    Then the output should contain "ERROR"

  Scenario: Share a link to a file
    When I run `envia share my_file`
    Then the output should contain "http:"
