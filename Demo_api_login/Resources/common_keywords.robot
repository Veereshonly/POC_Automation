*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Library     DateTime
Library     JsonValidator
Library     jsonschema
Library     OperatingSystem

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
    ${response}=     POST     url=${url}/${path}    json=&{data}      headers=&{headers}     expected_status=${expected_status_code}
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

Validate Response Values
     [Documentation]    This keyword is used to validate the response
     [Tags]             Validate Jsonresponse
     [Arguments]        ${response}      ${response_path}
     ${json_data}=      Get File    ${response_path}
     Should Be Equal As Strings       ${response}[2]       ${json_data}           values=True

Validate Response Schema and Execution Time
      [Documentation]     This keyword is used to validate response schema and time
      [Tags]               Validate Response
      [Arguments]          ${response}      ${schema_path}
      Validate Execution time       ${response}[0]      ${response}[1]
      Validate Jsonschema From File    ${response}[2]    ${schema_path}

Validate Execution time
    [Documentation]     This key word is used to validate the execution time
    ...                 Author-Veeresh
    [Tags]              Validate Execution time
    [Arguments]         ${time_before_api_call}      ${time_after_api_call}
    ${executiontime} =  Subtract Date From Date  ${time_after_api_call}    ${time_before_api_call}
    IF    ${executiontime} >= 2
         Fail
    END
