from distutils.log import debug
import MySQLdb,bcrypt
import MySQLdb.cursors
import pymysql
from flask import jsonify,Flask,render_template,url_for,request,redirect, make_response,session, escape, request
import GetDatabases
import hashlib
app = Flask(__name__)
app.secret_key = "super secret key"

#########################################################################################
@app.route('/AllDuties', methods = ['GET', 'POST'])
def AllDuties():
	if "username" in session:
		username= session["username"]
		data,headers=GetDatabases.AllFrom("duty")
		eid=GetDatabases.getEid(username)
		print(eid[0])
		mydata,myheaders=GetDatabases.getduties(eid[0])
	return render_template("Table.html",data=data,tableHeader=headers,mytableHeader=myheaders,mydata=mydata)

@app.route('/Approve', methods = ['GET', 'POST'])
def Approve():
	if "username" in session:
		username= session["username"]
		Status=request.form['dutyforexchange']		
		params=str(Status).split(",")
		print(params)
		GetDatabases.approveReject(params[0],params[1],params[2],params[3],params[4])
	return render_template("Table.html",data="null",tableHeader="null",mytableHeader="null",mydata="null")

@app.route('/xrequest1', methods = ['GET', 'POST'])
def xrequest1():
	if "username" in session:
		username= session["username"]
		eid=GetDatabases.getEid(username)
		data,headers=GetDatabases.getReceivedRequests(eid[0])
		mydata,myheaders=GetDatabases.getRequestsMade(eid[0])
	return render_template("xrequest.html",data=data,tableHeader=headers,mytableHeader=myheaders,mydata=mydata)


@app.route('/xrequest', methods = ['GET', 'POST'])
def xrequest():
	if "username" in session:
		username= session["username"]
		eid=GetDatabases.getEid(username)
		print(eid[0])
		Approver_dutyID_eid=request.form['dutyforexchange']		
		Requestor_dutyID_eid=request.form['req_duty']		        
		paramsB=str(Approver_dutyID_eid).split(",")
		paramsA=str(Requestor_dutyID_eid).split(",")
		print(paramsA)
		print(paramsB)
		GetDatabases.setRequest(paramsA[0],paramsB[0],eid[0],paramsB[2])
		data,headers=GetDatabases.getReceivedRequests(eid[0])
		mydata,myheaders=GetDatabases.getRequestsMade(eid[0])
	return render_template("xrequest.html",data=data,tableHeader=headers,mytableHeader=myheaders,mydata=mydata)
    
    
@app.route('/exchange', methods = ['GET', 'POST'])
def exchange():
	if "username" in session:
		username= session["username"]
		eid=GetDatabases.getEid(username)
		print(eid[0])
		Requester_dutyID_eid=request.form['dutyforexchange']		
		params=str(Requester_dutyID_eid).split(",")
		print(params)
		data,headers=GetDatabases.getPossibleExchange(eid[0],params[0])
	return render_template("Exchange.html",req_duty=str(Requester_dutyID_eid), data=data,tableHeader=headers)

@app.route('/myDuty', methods = ['GET', 'POST'])
def myDuty():
	if "username" in session:
		username= session["username"]
		eid=GetDatabases.getEid(username)
		print(eid[0])
		data,headers=GetDatabases.getduties(eid[0])
	return render_template("Table.html",data=data,tableHeader=headers)
#########################################################################################
@app.route('/login', methods = ['GET', 'POST'])
def login():
    if "username" in session:
        return redirect(url_for('AllDuties'))
    else:
        error = None
        if request.method == 'POST':
            username=str(request.form['username'])
            databaseHash=GetDatabases.getPassword(username)
            generatedHash=hashlib.md5(str(request.form['password']).encode('utf-8')).hexdigest()
            print(generatedHash)
            if databaseHash==generatedHash:
                session['username']=username
                return redirect(url_for('AllDuties'))
            else:
                return redirect(url_for('login'))
    return render_template("login.html",error=error)

@app.route('/profile', methods =['GET','POST'])
def myProfile():
    result=GetDatabases.getUserInfo(session['username'])
    data=str(result).split(",")

    return render_template("profile.html",Name=data[1],Department=data[2],Affiliation=data[3],Email=data[4])

@app.route('/logout')
def logout():
   session.pop('username', None)
   return redirect(url_for('login'))

#########################################################################################



if __name__ == '__main__':
    app.run(debug=True)
    session.clear()
