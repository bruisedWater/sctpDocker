*** Settings ***
Documentation     A test suite with a test that passes and a test that fails.
Resource          ../lib/sctpClient.robot

*** Variables ***
${sctpServerIP}      192.168.16.2    # Change this to the IP of your SCTP server
${sctpServerPort}    9991
${wrongPort}         8882
${message}           hello world


*** Test Cases ***
Send message and get back the reply
    ${reply} =    Send message to SCTP server    ${sctpServerIP}    ${sctpServerPort}    ${message}
    Log    Reply was: ${reply}

Send message to wrong port number and fail
    Send message to SCTP server    ${sctpServerIP}    ${wrongPort}    ${message}
    Fail    Test case should never reach this point
