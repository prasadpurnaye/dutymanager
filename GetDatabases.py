import mysql.connector
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
import MySQLconf as cfg


def getEid(username):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'SELECT eid FROM users where Email= ' + "'"+username+"'"
    mycursor.execute(sql)
    result = mycursor.fetchone();
    return (result)

def approveReject(a,b,c,d,e):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    status="Approved"    
    if(e=="False"):
        status="Rejected"
    sql = "UPDATE exchange SET Status = '"+status+"' WHERE  dutyid1="+a+" AND dutyid2="+b +" AND requestor="+ c+" AND approver="+ d
    print(sql)
    mycursor.execute(sql)
    mydb.commit()
    
    return ("NULL")


def setRequest(a,b,c,d):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql = "INSERT INTO exchange (dutyid1, dutyid2, requestor, approver,Status) VALUES (%s, %s, %s ,%s, %s)"
    val = (a, b,c,d,"requested")
    mycursor.execute(sql, val)
    mydb.commit()
    result=mycursor.rowcount
    return (result)

def AllFrom(table):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'SELECT * FROM '+table
    mycursor.execute(sql)
    result = mycursor.fetchall();
    field_names = [i[0] for i in mycursor.description]
    return (result,field_names)

def getReceivedRequests(eid):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'SELECT * FROM exchange where requestor= '+str(eid)
    print(sql)
    mycursor.execute(sql)
    result = mycursor.fetchall();
    field_names = [i[0] for i in mycursor.description]
    return (result,field_names)

def getRequestsMade(eid):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'SELECT * FROM exchange where approver= '+str(eid)
    print(sql)
    mycursor.execute(sql)
    result = mycursor.fetchall();
    field_names = [i[0] for i in mycursor.description]
    return (result,field_names)

def getduties(eid):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'SELECT * FROM duty where eid= '+str(eid)
    print(sql)
    mycursor.execute(sql)
    result = mycursor.fetchall();
    field_names = [i[0] for i in mycursor.description]
    return (result,field_names)

def getPossibleExchange(eid,xDate):
    """fetch all results from parameter table"""
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    sql= 'Select * from duty where eid in (SELECT DISTINCT eid FROM `duty` where Date <> '+ str(xDate)+ ') and Date NOT IN (SELECT Date from duty where eid = '+str(eid)+')'
    print(sql)
    mycursor.execute(sql)
    result = mycursor.fetchall();
    field_names = [i[0] for i in mycursor.description]
    return (result,field_names)

def getPassword(username):
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    print(username)
    sql= "SELECT password FROM `users` WHERE email='"+username+"'"
    try:
        mycursor.execute(sql)
        result = mycursor.fetchone();
        mycursor.close()
        return result[0]
    except:
        return "-1"




def getUserInfo(username):
    mydb = mysql.connector.connect(  host=cfg.mysql["host"], user=cfg.mysql["user"], password=cfg.mysql["password"], database=cfg.mysql["database"],auth_plugin=cfg.mysql["auth_plugin"])
    mycursor = mydb.cursor()
    print(username)
    sql= "SELECT * FROM `users` WHERE Email="+"'"+username+"'"
    try:
        mycursor.execute(sql)
        result = mycursor.fetchall();
        mycursor.close()
        return result
    except:
        return "-1"
