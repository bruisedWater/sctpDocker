*** Settings ***
Documentation     A test suite with a test that passes and a test that fails.
Resource          ../lib/sctpClient.robot

*** Variables ***
${sctpServerIP}      172.30.0.2
${sctpServerPort}    9991
${wrongPort}         8882
${message}           hello world


*** Test Cases ***
Send message and get back the reply
    ${reply} =    Send message to SCTP server    ${sctpServerIP}    ${sctpServerPort}    ${message}
    Log to console    Reply was: ${reply}

Send message to wrong port number and fail due to timeout
    Send message to SCTP server    ${sctpServerIP}    ${wrongPort}    ${message}
    Fail    Test case should never reach this point
