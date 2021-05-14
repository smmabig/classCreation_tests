*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Class
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page
Test Template     Create Class With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               					TITLE       	 DESCRIPTION		    DIFFICULTY		      LANGUAGE
Empty Title	                 						${EMPTY}		 ${VALID DESCRIPTION}   ${VALID DIFFICULTY}   ${VALID LANGUAGE}
Empty Description									${VALID TITLE}   ${EMPTY}    		    ${VALID DIFFICULTY}   ${VALID LANGUAGE}             
Empty Difficulty									${VALID TITLE}   ${VALID DESCRIPTION}   ${EMPTY DIFFICULTY}   ${VALID LANGUAGE}
Empty Language										${VALID TITLE}   ${VALID DESCRIPTION}   ${VALID DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Title And Description      					${EMPTY}         ${EMPTY}    			${VALID DIFFICULTY}   ${VALID LANGUAGE}
Empty Title And Difficulty							${EMPTY}		 ${VALID DESCRIPTION}   ${EMPTY DIFFICULTY}	  ${VALID LANGUAGE}
Empty Title And Language							${EMPTY}		 ${VALID DESCRIPTION}   ${VALID DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Description And Difficulty					${VALID TITLE}   ${EMPTY}    		    ${EMPTY DIFFICULTY}	  ${VALID LANGUAGE}
Empty Description And Language						${VALID TITLE}   ${EMPTY}    		    ${VALID DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Difficulty And Language						${VALID TITLE}   ${VALID DESCRIPTION}   ${EMPTY DIFFICULTY}	  ${EMPTY LANGUAGE}
Empty Title, Description And Difficulty				${EMPTY}		 ${EMPTY}				${EMPTY DIFFICULTY}   ${VALID LANGUAGE}
Empty Title, Description And Language				${EMPTY}		 ${EMPTY}				${VALID DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Title, Difficulty And Language				${EMPTY}		 ${VALID DESCRIPTION}   ${EMPTY DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Description, Difficulty And Language			${VALID TITLE}	 ${EMPTY}				${EMPTY DIFFICULTY}   ${EMPTY LANGUAGE}
Empty Title, Description, Difficulty And Language 	${EMPTY}         ${EMPTY}				${EMPTY DIFFICULTY}   ${EMPTY LANGUAGE}

*** Keywords ***
Create Class With Invalid Credentials Should Fail
    [Arguments]    ${title}    ${description}    ${difficulty}    ${language}
	Input Title    	  	 ${title}
    Input Description    ${description}
	Input Difficulty 	 ${difficulty}
	Input Language 	 	 ${language}	
    Submit Credentials
    Create class Should Have Failed

Create Class Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
