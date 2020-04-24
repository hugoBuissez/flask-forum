from datetime import datetime
from flask import Flask, render_template, url_for, request, redirect
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
app.secret_key = b'notAGoodSecretKey'

# Change credentials to test it if necessary
cnx = mysql.connector.connect(host="localhost", 
                              user="root",
                              password="rootpass",
                              database="forum")
cursor = cnx.cursor()

#Q1 = "CREATE TABLE topic (id int PRIMARY KEY AUTO_INCREMENT, title varchar(50), subheading varchar(50), created_date varchar(50), claims int)"
#Q2 = "CREATE TABLE claims (topicId int PRIMARY KEY,  FOREIGN KEY(topicId) REFERENCES topic(id), title varchar(50), subheading varchar(50), created_date varchar(50), replies int)"

#cursor.execute(Q1)
#cursor.execute(Q2)

@app.route('/')
def view():	
	sqlSelect = "SELECT * FROM topic ORDER BY id DESC"
	cursor.execute(sqlSelect ,())
	results = cursor.fetchall()
	cnx.commit()

	return render_template("index.html", topics=results)

@app.route('/claims/<idtopic>')
def claims(idtopic):

	sqlDisplay = "SELECT * FROM claims WHERE topicId=(%s)"
	sqlTopicTitle = "SELECT * FROM topic WHERE id=(%s)"

	cursor.execute(sqlDisplay, (idtopic, ))
	results = cursor.fetchall()

	cursor.execute(sqlTopicTitle, (idtopic, ))
	title = cursor.fetchall()

	cnx.commit()

	return render_template("claims.html", claims=results, topic=title)

@app.route('/', methods=['GET', 'POST'])
def addTopic():

	if request.method == "POST":
		topicName = request.form["topicName"]
		topicSub = request.form["topicSub"]
		sqlInsert = "INSERT INTO topic (title, subheading) VALUES (%s, %s)"

		cursor.execute(sqlInsert, (topicName, topicSub))
		cnx.commit()
	
	return redirect(url_for("view"))

@app.route('/claims', methods=['GET', 'POST'])
def addClaim():
	
	name = request.form["title"]
	sub = request.form["sub"]
	topic = request.form["topic"]

	sqlInsert = "INSERT INTO claims (topicId, title, subheading) VALUES (%s,%s,%s)"
	sqlIncre = "UPDATE topic SET claims = claims+1 WHERE id = %s"

	cursor.execute(sqlInsert, (topic, name, sub, ))
	cursor.execute(sqlIncre, (topic, ))
	cnx.commit()

	return redirect(url_for("claims", idtopic=topic))


@app.route('/delClaims/<idClaim>/<idTopic>', methods=['GET', 'POST'])
def delClaim(idClaim=None, idTopic=None):
	sqlDel = "DELETE FROM claims WHERE id=%s"
	sqlDecr = "UPDATE topic SET claims = claims-1 WHERE id = %s"

	cursor.execute(sqlDel, (idClaim, ))
	cursor.execute(sqlDecr, (idTopic, ))
	cnx.commit()

	return redirect(url_for("claims", idtopic=idTopic))

@app.route('/delTopic/<idTopic>', methods=['GET', 'POST'])
def delTopic(idTopic):

	# Remove the topic
	sqlDel = "DELETE FROM topic WHERE id=%s"
	# and its associated claims
	sqlDelClaims = "DELETE FROM claims WHERE topicId=%s"

	cursor.execute(sqlDelClaims, (idTopic, ))
	cursor.execute(sqlDel, (idTopic, ))
	cnx.commit()

	return redirect(url_for('view'))



		


