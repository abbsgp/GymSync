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

def get_name(user_id):
    with connection.cursor() as cursor:
        sql = 'SELECT * FROM client WHERE Member_id = %s'
        cursor.execute(sql, (user_id,))
        result = cursor.fetchone() #fetches the first one

        if result:
            return{
                'id': result['Member_Id'],
                'username': result['Name'],
                'password': result['Password']
            }


def check_password(username, password):
    user = get_user(username)
    print(username, password, user)

    if user and user['password'] == password:
        return True

    return False

def add_user(username, phone, password):
    with connection.cursor() as cursor:
        sql = 'SELECT MAX(Member_Id) FROM client'
        cursor.execute(sql)
        result = cursor.fetchone()
        print(result)
        
        if result:
            MemberID = str(int(result['MAX(Member_Id)']) + 1)

            sql = 'INSERT INTO client (Member_Id, Contact_Information, Name, Password) VALUES (%s,%s,%s,%s)'
            try:
                cursor.execute(sql, (MemberID, phone, username, password))
                connection.commit()
                return True
            except pymysql.Connection.Error as error: #alias
                print(error)
                return False

    return False
            


