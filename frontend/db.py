# backend/db.py
import pymysql.cursors

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
                'password': result['Password']
            }

    return None

def check_password(username, password):
    user = get_user(username)
    print(username, password, user)

    if user and user['password'] == password:
        return True

    return False

