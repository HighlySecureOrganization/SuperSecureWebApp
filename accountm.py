# -*- coding: utf-8 -*-
import json
import sys
import subprocess
import os
def Excute_Command(cmd):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    msg = p.stdout.readlines()
#     sometimes the network in not stable, try 10 time to connect
    if msg:
        return msg
    else:
        for a in range(1,11):
            p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
            msg = p.stdout.readlines()
            if msg:
                return msg
            else:
                print "Fail to connect to ServiceNow host"
                
def List_Users(username, password,url):
    usercontentlist=[]
    cmd = ".\Tool\curl.exe  curl -s " +url +"/api/v2/users.json -u " + username + ":" + password
    cond=Excute_Command(cmd)
    usersDic=json.loads(cond[0])
    useraccounts=usersDic["count"]
    pages=int(useraccounts)/100
    for mypage in range(1,pages+2):
        cmd = ".\Tool\curl.exe  curl -s "+url+"/api/v2/users.json?page="+str(mypage)+" -u " + username + ":" + password
        cond=Excute_Command(cmd)
        temp_userdic1=json.loads(cond[0])
        temp_userdic2=temp_userdic1['users']
        usercontentlist.extend(temp_userdic2)
    i=1
    userattribute=["id","role","email","phone","ctive","name",]
    for a in range(len(usercontentlist)):
        usersDic=usercontentlist[a]
        print "*************  ",i,"  ***************"
        for k,v in usersDic.iteritems():
            if k in userattribute:
                if v:
                    print k,v
                else:
                    print k

        i+=1    

'''   
#1 get all users list(inorder to find user email)
#2 create a user 
#3 query user detail info by email
#4 delete user by url
#5 buk delte user(email end with suffix)
'''

# username = "hello@0daygod.xyz"
# password = "sdd35@#%RWewf"
# url = "https://0daygod.xyz"
# create_user = "Binit"
# create_user_email = "binit@0daygod.xyz"
     






