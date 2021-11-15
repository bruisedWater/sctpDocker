*** Settings ***
Library    ./sctpClient.py


*** Variables ***


*** Keywords ***
Send message to SCTP server
    [Arguments]    ${ip}    ${port}    ${message}
    ${reply} =    Send message    ${ip}    ${port}    ${message}
    [Return]    ${reply}
