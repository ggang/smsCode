*** Settings ***
Resource          keyword.robot

*** Test Cases ***
test_send_code
    post_send_code    http://web.1xinxi.cn/asmx    aaa    13052560931
