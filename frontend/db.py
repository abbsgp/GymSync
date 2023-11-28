# backend/db.py
import pymysql.cursors
from werkzeug.security import generate_password_hash, check_password_hash

connection = pymysql.connect(
    host='localhost',
    user='root',
    password='password',
    database='gymsync',
    cursorclass=pymysql.cursors.DictCursor
)

def get_user(username):
    with connection.cursor() as cursor:
        sql = 'SELECT * FROM client WHERE Name = %s'
        cursor.execute(sql, (username,))
        result = cursor.fetchone()

        if result:
            return {
                'id': result['Member_Id'],
                'username': result['Name'],
                'password_hash': result['Password']
            }

    return None

def create_user(username, password):
    hashed_password = generate_password_hash(password, method='sha256')

    with connection.cursor() as cursor:
        sql = 'INSERT INTO client (Name, Password) VALUES (%s, %s)'
        cursor.execute(sql, (username, hashed_password))

    connection.commit()

def check_password(username, password):
    user = get_user(username)

    if user and check_password_hash(user['password_hash'], password):
        return True

    return False
