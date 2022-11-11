*** Settings ***
Resource     ../Resources/common_keywords.robot
Resource     ../Variables/env_variables.robot
Test Timeout     5 s

*** Test Cases ***
Sign In Positive Test case
    [Documentation]     Test to check positive sign in scenario
    ...                 Author-Veeresh
    [Tags]              Sign In Positive Test case        positive
    ${expected_status_code}=      Set Variable     200
    &{data}=      create dictionary       email=${email}  password=${password}
    ${path}=     Set Variable     login
    ${response}=      Make Post Request and validate response code     ${expected_status_code}     ${path}     &{data}
    Validate positive sign in response       ${response}


Sign In Negative Test Case Empty value for Email address valid password
     [Documentation]     Test to check negative sign in scenario - Empty Email address valid password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Empty value for Email address valid password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${empty_email}  password=${password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code        ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}


Sign In Negative Test Case Valid Email address empty value for password
     [Documentation]     Test to check negative sign in scenario - Valid Email address empty password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Valid Email address empty value for password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${email}  password=$${empty_password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code     ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Test Case Empty value for Email address empty value for password
     [Documentation]     Test to check negative sign in scenario - Valid Email address empty password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Empty value for Email address empty value for password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${empty_email}  password=$${empty_password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code     ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Test Case Invalid value for Email address valid value for password
     [Documentation]     Test to check negative sign in scenario - InValid Email address empty password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Invalid value for Email address valid value for password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${invalid_email}  password=$${password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code     ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Test Case Valid value for Email address Invalid value for password
     [Documentation]     Test to check negative sign in scenario - InValid Email address empty password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Valid value for Email address Invalid value for password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${email}  password=$${invalid_password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code     ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Test Case Invalid value for Email address Invalid value for password
     [Documentation]     Test to check negative sign in scenario - InValid Email address empty password
     ...                 Author-Veeresh
     [Tags]              Sign In Negative Test Case Invalid Email address Invalid password       negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${invalid_email}  password=$${invalid_password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code     ${expected_status_code}      ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Test Case With Additional Key in Payload
     [Documentation]      Test to check negative sign in scenario - Additional key in payload
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Test Case With Additional Key in Payload      negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${email}  password=${password}    thirdvalue=additonal value
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}

Sign In Negative Test Case With Invalid REST method
     [Documentation]      Test to check negative sign in scenario - Invalid REST method
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Test Case With Invalid REST method     negative
     ${expected_status_code}=      Set Variable     404
     &{data}=      create dictionary       email=${email}  password=$${password}
     ${path}=     Set Variable     login
     ${response}=      Make Put Request with additonal key and validate response code     ${expected_status_code}      ${path}     &{data}

Sign In Negative Case With Invalid key for password in paylaod
     [Documentation]      Test to check negative sign in scenario - Invalid key for password in paylaod
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Case With Invalid key in paylaod      negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${email}  access_key=${password}    thirdvalue=additonal value
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}    &{data}
     Validate negative response    ${response}

Sign In Negative Case With Invalid key for email in paylaod
     [Documentation]      Test to check negative sign in scenario - Invalid key for email in paylaod
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Case With Invalid key for email in paylaod      negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       user_name=${email}  access_key=${password}    thirdvalue=additonal value
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}
     Validate negative response    ${response}

Sign In Negative Case Without Email in paylod
     [Documentation]      Test to check negative sign in scenario - Without email in payload
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Case Without Email in paylod      negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       passowrd=${password}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}    &{data}
     Validate negative response    ${response}

Sign In Negative Case Without Password in paylod
     [Documentation]      Test to check negative sign in scenario - Without password in payload
     ...                  Author-Veeresh
     [Tags]               Sign In Negative Case Without Password in paylod      negative
     ${expected_status_code}=      Set Variable     400
     &{data}=      create dictionary       email=${email}
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}    &{data}
     Validate negative response    ${response}

Sign In Negative Case with empty payload
     [Documentation]       Test to check negative sign in scenario - Empty payload
     ...                   Author-Veeresh
     [Tags]               Sign In Negative Case with empty payload     negative
     ${expected_status_code}=      Set Variable     400
     ${path}=     Set Variable     login
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}    &{EMPTY}
     Validate negative response    ${response}

Sign In Negative Case with Invalid path
     [Documentation]       Test to check negative sign in scenario - Empty payload
     ...                   Author-Veeresh
     [Tags]                Sign In Negative Case with Invalid path      negative
     ${expected_status_code}=      Set Variable     404
     &{data}=      create dictionary       user_name=${email}  password=${password}
     ${path}=     Set Variable     logout
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}
     Validate negative 404 response    ${response}

Sign In Negative Case with Empty path
     [Documentation]       Test to check negative sign in scenario - Empty payload
     ...                   Author-Veeresh
     [Tags]                Sign In Negative Case with Empty path      negative
     ${expected_status_code}=      Set Variable     404
     &{data}=      create dictionary       user_name=${email}  password=${password}
     ${path}=     Set Variable     ${EMPTY}
     ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}
     Validate negative 404 response    ${response}

Sign In Negative Case with empty key for email
    [Documentation]      Test to check negative sign in scenario - Empty key for email
    ...                  Author-Veeresh
    [Tags]               Sign In Negative Case with empty key for email      negative
    ${expected_status_code}=      Set Variable     400
    &{data}=      create dictionary       ${EMPTY}=${email}  password=${password}
    ${path}=     Set Variable     login
    ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}

Sign In Negative Case with empty key for password and email
    [Documentation]      Test to check negative sign in scenario - Empty key for email
    ...                  Author-Veeresh
    [Tags]               Sign In Negative Case with empty key for password and email      negative
    ${expected_status_code}=      Set Variable     400
    &{data}=      create dictionary       ${EMPTY}=${email}  ${EMPTY}=${password}
    ${path}=     Set Variable     login
    ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}

Sign In Negative Case with empty key for password
    [Documentation]      Test to check negative sign in scenario - Empty key for email
    ...                  Author-Veeresh
    [Tags]               Sign In Negative Case with empty key for password      negative
    ${expected_status_code}=      Set Variable     400
    &{data}=      create dictionary       email=${email}  ${EMPTY}=${password}
    ${path}=     Set Variable     login
    ${response}=      Make Post Request and validate response code       ${expected_status_code}     ${path}     &{data}