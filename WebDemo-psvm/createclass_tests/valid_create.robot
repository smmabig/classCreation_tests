*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Create Class
    Input Title    	  	 YogaClass
    Input Description    This is yoga class
	Input Difficulty 	 3
	Input Language 	 	 3
    Submit Credentials
    Result Page Should Be Open
    [Teardown]    Close Browser
