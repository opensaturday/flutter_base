Feature: 사용자는 '이메일'과 '비밀번호'를 입력 한 후 '로그인하기'버튼을 누른 후 로그인에 성공해야 한다.

	Scenario: 이메일과 비밀번호가 입력된 후 로그인 버튼이 동작하는지 검사한다.
		Given I have "emailfield" and "passfield" and "LoginButton"
		When I fill the "emailfield" field with "youremail@gmail.com"
		AND I fill the "passfield" field with "1234"
		Then I tap the "LoginButton" button

	Scenario: 이메일만 입력 한 후 로그인 버튼이 동작하는지 검사한다.
        Given I have "emailfield" and "passfield" and "LoginButton"
        When I fill the "emailfield" field with "youremail@gmail.com"
        Then I tap the "LoginButton" button

    Scenario: 비밀번호만 입력 한 후 로그인 버튼이 동작하는지 검사한다.
        Given I have "emailfield" and "passfield" and "LoginButton"
        When I fill the "passfield" field with "1234"
        Then I tap the "LoginButton" button