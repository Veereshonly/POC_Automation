*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Library     DateTime

Resource    ../Variables/env_variables.robot
Resource    ../Variables/common_variables.robot

*** Keywords ***
Make Post Request and validate response code
    [Documentation]    This Key word is used to make API requests
    ...                Author-Veeresh
    [Tags]             Make Post Request and validate response code
    [Arguments]       ${expected_status_code}     ${path}     &{data}
    &{headers}=     create dictionary       Content-Type=application/json
    ${time_before_api_call}=     Get Current Date
    ${response}=      POST   url=${url}/${path}    json=&{data}      headers=&{headers}     expected_status=${expected_status_code}
    Status Should Be    ${expected_status_code}  ${response}
    ${res}=    Evaluate     json.loads("""${response.content}""")    json
    ${time_after_api_call}=     Get Current Date
    [Return]      ${time_before_api_call}      ${time_after_api_call}       ${res}


Make Put Request with additonal key and validate response code
    [Documentation]    This Key word is used to make API requests
    ...                Author-Veeresh
    [Tags]             Make Post Request and validate response code
    [Arguments]       ${expected_status_code}      ${path}     &{data}
    &{headers}=     create dictionary       Content-Type=application/json
    ${time_before_api_call}=     Get Current Date
    ${response}=      PUT   url=${url}/${path}    json=&{data}      headers=&{headers}     expected_status=${expected_status_code}
    Status Should Be    ${expected_status_code}  ${response}
    ${res}=    Evaluate     json.loads("""${response.content}""")    json
    ${time_after_api_call}=     Get Current Date
    [Return]      ${time_before_api_call}      ${time_after_api_call}       ${res}


Validate positive sign in response
      [Documentation]     This keyword is used to validate Positive response schema
      ...                 Author-Veeresh
      [Tags]              Validate positive sign in response
      [Arguments]         ${response}
      ${time_before_api_call}=     Set Variable      ${response}[0]
      ${time_after_api_call}=     Set Variable      ${response}[1]
      ${res}=      Set Variable      ${response}[2]
      Validate Execution time       ${time_before_api_call}      ${time_after_api_call}
      ${expected_response_lenghth}=      Set Variable     4
      Validate Schema length      ${res}       ${expected_response_lenghth}
      Validate data type and length for given key     ${res['accesstoken']}    <class 'str'>      1327
      Validate data type and length for given key     ${res['refreshToken']}      <class 'str'>      1785
      Validate data type and length for given key     ${res['roleid']}      <class 'str'>      1
      Validate data type and length for given key     ${res['customerid']}      <class 'str'>      1

Validate negative response
     [Documentation]     This key word is used to validate negative response schema
     ...                 Author-Veeresh
     [Tags]              Validate negative response
     [Arguments]         ${response}
     ${time_before_api_call}=     Set Variable      ${response}[0]
      ${time_after_api_call}=     Set Variable      ${response}[1]
      ${res}=      Set Variable      ${response}[2]
      Validate Execution time       ${time_before_api_call}      ${time_after_api_call}
      ${expected_response_lenghth}=      Set Variable     2
      Validate Schema length      ${res}       ${expected_response_lenghth}
      IF    "${res['status_code']}" != "COG-ERR-010"
           Fail
      END
      IF    "${res['description']}" != "Login error"
           Fail
      END
      Validate data type and length for given key     ${res['status_code']}    <class 'str'>      11
      Validate data type and length for given key     ${res['description']}      <class 'str'>      11


Validate negative 404 response
     [Documentation]    This key word is used to validate negative 404 response
     [Tags]             Validate negative 404 response
     [Arguments]         ${response}
     ${time_before_api_call}=     Set Variable      ${response}[0]
     ${time_after_api_call}=     Set Variable      ${response}[1]
     ${res}=      Set Variable      ${response}[2]
     Validate Execution time       ${time_before_api_call}      ${time_after_api_call}
     ${expected_response_lenghth}=      Set Variable     1
     Validate Schema length      ${res}       ${expected_response_lenghth}
     IF    ${res['error']} == "${EMPTY}"
          Fail
     END



Validate Execution time
    [Documentation]     This key word is used to validate the execution time
    ...                 Author-Veeresh
    [Tags]              Validate Execution time
    [Arguments]         ${time_before_api_call}      ${time_after_api_call}
    ${executiontime} =  Subtract Date From Date  ${time_after_api_call}    ${time_before_api_call}
    IF    ${executiontime} >= 2
         Fail
    END

Validate Schema length
    [Documentation]     This keyword is used to validate the schema
    ...                 Author-Veeresh
    [Tags]              Validate Schema
    [Arguments]         ${response}     ${expected_response_lenghth}
    #Check length of response
    ${length_of_resp}=     Get Length    ${response}
    IF    ${length_of_resp} != ${expected_response_lenghth}
         Fail
    END

Validate data type and length for given key
     [Documentation]     This keyword is used to validate data type and lenght of a key in given response
     ...                 Author-Veeresh
     [Arguments]         ${key}     ${expected_key_data_type}        ${expected_key_data_length}
    #Check data-type of Key
    ${key_data_type}=      Evaluate    type("${key}")
    IF    "${key_data_type}" != "${expected_key_data_type}"
           Fail
    END
    #Check length of Key
    ${key_len}=      Get Length    ${key}
    IF    ${key_len} != ${expected_key_data_length}
          Fail
    END



