Feature: 사용자는 홈 화면으로 진입하여 필요한 정보를 확인하고 처리한다.
  Hello World feature test

  Scenario: 홈 화면으로 이동한다.
    Given I go to home page
    Then I expect home page title to be "Home"
