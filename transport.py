#!/usr/bin/env python3
import pymysql
import requests
import json
import time
from io import BytesIO
#from telegram.ext import Updater
from pymysql.cursors import DictCursor

connection = False;
lastUpdate = 0

def mysql_connect():
	connection = False
	while connection == False or connection.open == False:
		try:
			time.sleep(2)
			connection = pymysql.connect(
				host='localhost',
				user='root',
				password='',
				db='eg',
				charset='utf8',
				cursorclass=DictCursor
			)
		except:
			print("Error while connecting to MySQL")
	return connection	

def mysql_error(e):
	print("Mysql error", e)
	connection = mysql_connect()
	return connection

connection = mysql_connect()
while True:
	try:
		cur = connection.cursor()
		cur.execute("SELECT notification.id as id, notification.message as message, user.telegram_id as chat_id FROM notification " +
			"INNER JOIN user ON user.id = notification.user_id " +
			"WHERE notification.unread_telegram = 1 AND user.telegram_id")
		notifications = cur.fetchall()
		for notification in notifications:
			result = send_message(notification['chat_id'], 'Вам пришло уведомление: ' + notification['message'])
			if result != False:
				cur = connection.cursor()
				cur.execute("UPDATE notification SET unread_telegram = 0 WHERE id = %s", notification['id'])
				connection.commit()
		cur = connection.cursor()
		cur.execute("SELECT message.from_id, message.id as id, user_to.telegram_id as chat_id, " +
			"user_from.username as username, message.message as message FROM message " +
			"INNER JOIN user as user_from ON user_from.id = message.from_id " +
			"INNER JOIN user as user_to ON user_to.id = message.to_id " +
			"WHERE message.unread_telegram = 1 AND user_to.telegram_id")
		messages = cur.fetchall()
		for message in messages:
			if (message['message'].startswith('###')):
				result = send_message(message['chat_id'], 'Пользователь ' + message['username'] + ' пригласил вас в сделку')
			else:
				result = send_message(message['chat_id'], 'Вам пришло сообщение от пользователя ' + message['username'])
			if result != False:
				cur = connection.cursor()
				cur.execute("UPDATE message SET unread_telegram = 0 WHERE id = %s", message['id'])
				connection.commit()
		connection.commit()
	except (pymysql.err.InternalError, pymysql.err.OperationalError, pymysql.err.InterfaceError) as e:
		connection = mysql_error(e)
	time.sleep(1)
	
	#except (pymysql.err.InternalError, pymysql.err.OperationalError):
	#	try:
	#		connection = pymysql.connect(
	#			host='localhost',
	#			user='root',
	#			password=password,
	#			db='bigbro_test',
	#			charset='utf8',
	#			cursorclass=DictCursor
	#		)
	#	except:
	#		time.sleep(2)
	#except:
	#	print("Exception")