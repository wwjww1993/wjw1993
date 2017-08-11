#coding=utf-8
import json
import requests
import urllib
import urllib2
import MySQLdb as mysql
import types
class Data_crud(object):
    def _init_(self):
        pass

    def ConnMysql(self,context):
        conn1 = mysql.connect(db='account', user="root", passwd="aijia1234567", host='192.168.1.32', port=3306,charset="utf8")
        cur = conn1.cursor();
        result = cur.fetchmany(cur.execute(context))
        cur.close();
        conn1.commit();
        conn1.close();
        return result


#就是输入参数的值，提供三个参数的值：
    def Data(self,values1,values2,values3,values4):

        data={
             "userId": values1,
            "amount":values2,
             "remark": values3
            }
        r=requests.post(values4, json=data)
        return r


    def ajbActivityRecharge(self,values1,values2,values3,values4,values5):
        data = {
            "userId": values1,
             "amount": values2,
            "remark": values3,
            "activityCode":values4
            }
        r = requests.post(values5, json=data)
        return r


    def ajbWithdrawCancel(self, values1,values2):
        data = {
            "orderNum": values1
            }
        r = requests.post(values2, json=data)
        return r

    def freezePay(self,values1,values2,values3,values4,values5):
        data={
            "userId": values1,
            "orderNum": values2,
            # "cashCouponAmount":values3,
            # "earnestMoneyAmount": values4,
            #  "frontMoneyAmount": values5,
            "ajbAmount":values3,
            "remark": values4,
        }
        r = requests.post(values5, json=data)
        return r


    # def timestamp_from_objectid(objectid):
    #         result = time.mktime(objectid.generation_time.timetuple())
    #         return result
    #         if __name__ == '__main__':
    #             timestamp_from_objectid('59575fe238edd93947f1f302')
    #             print  result
    #             print ("1")

        # if __name__ == '__main__':
#         valus2={
#   "userId": 10000,
#   "amount": 22,
#   "remark": ""
# }
#         r=requests.post("http://192.168.1.31:10003/ihome-api/settlement/ajbRecharge",json=valus2)
#         print r.text













