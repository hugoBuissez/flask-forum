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


@app.route('/')
def view():	
	sqlSelect = "SELECT * FROM topic ORDER BY idtopic DESC"
	cursor.execute(sqlSelect ,())
	results = cursor.fetchall()
	cnx.commit()

	print(results)

	return render_template("index.html", topics=results)

@app.route('/claims/<idtopic>')
def claims(idtopic):

	print(idtopic)
	sqlDisplay = "SELECT * FROM claims WHERE related_topic=(%s) ORDER BY idclaim DESC"
	cursor.execute(sqlDisplay, (idtopic, ))
	results = cursor.fetchall()
	cnx.commit()

	return render_template("claims.html", claims=results, topic=idtopic)

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
	
	claimName = request.form["claimName"]
	topRelated = request.form["topic"]

	sqlInsert = "INSERT INTO claims (title, related_topic, replies) VALUES (%s,%s,%s)"
	sqlIncre = "UPDATE topic SET claims = claims+1 WHERE idtopic = %s"

	cursor.execute(sqlInsert, (claimName, topRelated, 0))
	cursor.execute(sqlIncre, (topRelated, ))
	cnx.commit()

	return redirect(url_for("claims", idtopic=topRelated))
		


