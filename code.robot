*** Settings ***
Resource          keyword.robot

*** Test Cases ***
test_send_code
    ${mobile}    get_send_mobile    13611873856    13052560931
    ${send_time}    get_curtime
    post_send_code    http://web.1xinxi.cn/asmx    您在钢钢网找回密码的验证码为：123456,请尽快操作,如果不是本人操作,请不必理会.发送时间:${send_time}【钢钢网】    ${mobile}
