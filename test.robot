*** Settings ***
Library           requests
Library           json
Library           Selenium2Library
Library           DatabaseLibrary
Library           pymysql

*** Test Cases ***
test
    Comment    ${text}    set Variable    helloword
    Comment    log    ${text}
    ${data}    set Variable    {"roleCode":0}
    ${url}    set Variable    http://boss.sst.ihomefnt.org/cms-web/resource/init/580/508CEEE217046EB198F5C2099C7579C0
    ${response}    requests.post    ${url}    data=${data}
    log    ${response}
    ${response2}    set Variable    ${response.text}
    log    ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
    ${response3}    json.loads    ${response2}
    log    ${response3.keys()}
    log    ${response3[u'ext'][u'msg']}
    Comment    Should Be Equal As Strings    ${response3[u'ext'][u'msg']}    成功

shujuku
    Connect To Database Using Custom Params    pymysql    host='localhost' ,port='3306',user='root',passwd='123456',db='wjw'
    ${a}    Query    select * from user
    log    ${a[0][1]}
    Disconnect From Database
    Comment    log    ${a}
