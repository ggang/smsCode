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

get_send_mobile
    [Arguments]    ${mobile_mon}    ${mobile_after}
    [Documentation]    根据时间判断赋值，返回队应时间发送的电话号码
    ${hour}    get time    hour
    ${send_mobile}=    set variable if    ${hour}<=13    ${mobile_mon}    ${mobile_after}
    log    ${send_mobile}
    [Return]    ${send_mobile}
