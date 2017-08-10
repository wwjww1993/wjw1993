*** Settings ***
Library           DatabaseLibrary
Library           wjwTestLibrary
Library           requests
Library           json
Library           urllib2
Library           RequestsLibrary
Library           BuiltIn
Library           Selenium2Library
Library           demjson
Library           Collections

*** Test Cases ***
shujuku
    Connect To Database Using Custom Params    pymysql    host='localhost' ,port=3306,user='root',password='123456',database='wjw',charset='utf8'
    ${result}    Query    select * from user
    log    ${result[0][0]}
    Disconnect From Database
    Comment    ${resutDecode}    decode    ${result[0][0]}    UTF-8
    log    ${result[1][0]}

guanjianzi
    comment    ${a}    ConnMysql    wjw    select * from user
    Comment    log    ${a[0][0]}
    ${data}    set Variable    {"menuId":"19"}
    ${url}    set Variable    http://boss.sst.ihomefnt.org/cms-web/resource/quertyPropsByAdminId/597/7CC78315725B019ABE965CEB478A97C3
    ${response}    requests.post    ${url}
    Should Be Equal As Integers    ${response.status_code}    200
    log    ${response.text}
    ${response1}    to json    ${response.text}
    log    ${response1}
    Comment    ${response1Dic}    Evaluate    demjson.decode(u'${response.text}')    demjson
    ${a}    Get From Dictionary    ${response1['ext']}    msg
    should be equal    ${a}    成功
    log    ${a}

yuanshengpost
    ${a}    ConnMysql    users    select * from t_user where mobile ='18888888877'
    ${b}    ConnMysql    account    select * from t_account where user_id ='${a[0][0]}'
    ${c}    convert to string    ${a[0][5]}
    should be empty    ${b}
    should be equal    ${c}    1
    set suite variable    ${a[0][0]}
    log    ${a[0][0]}

ceshi
    ${r}    Judge    ${a[0][0]}
    log    ${r}
    Should Be Equal As Integers    ${r.status_code}    200
    ${r1}    to json    ${r.text}
    should be equal as strings    ${r1['msg']}    success
    should be equal as strings    ${r1['success']}    True
    ${a}    Get From Dictionary    ${r1['data']}    accountId
    log    ${a}
    set suite variable    ${global}    ${a}

delete
    log    ${global}
    ${a}    ConnMysql    account    delete from t_account where id ='${global}'
    should be empty    ${a}

check shujuku

*** Keywords ***
delete
