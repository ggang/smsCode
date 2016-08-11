*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           Selenium2Library

*** Keywords ***
post_send_code
    [Arguments]    ${url}    ${content}    ${mobile}
    create session    api    ${url}
    ${res}    get request    api    /smsservice.aspx?name=13818727639&pwd=EA4D4F2D1884447F541B47EE448B&content=${content}&mobile=${mobile}&type=pt
    should be equal as strings    ${res.status_code}    200
    Comment    ${responseData}    to json    ${res.content}
    log    ${res.content}
    ${a}    evaluate    '${res.content}'.decode('utf-8')
    should contain    ${a}    提交成功
