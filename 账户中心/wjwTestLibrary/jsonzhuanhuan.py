#!/usr/bin/env python
# encoding=utf8
import sys
reload(sys)
sys.setdefaultencoding('utf8')
import json


jsonData = '{"成功":1,"b":"败","c":3,"d":4,"e":5}';

text = json.loads(jsonData)
print sys.getdefaultencoding()
print text
print jsonData
#print json.dumps(text,ensure_ascii=False)




#print (text.decode('utf-8').encode('gb2312'))
