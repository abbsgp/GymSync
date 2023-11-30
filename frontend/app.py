# backend/app.py
from flask import Flask, render_template, request, redirect, url_for, session
from db import get_user, get_name, check_password, add_user
import bcrypt

app = Flask(__name__, template_folder='template')
app.secret_key = b'2\xe9\x8c\xa3\xe0\xd6M\xa5$\xe7.h5\xb4v\xc6\xbaDmv\x98\x17\x9d\xe9'

@app.route('/')
def home():
    if 'user' in session:
        # Convert 'id' to an integer
        user_id = int(session['user']['id'])
        user=get_name(user_id)['username']
        print(user) #shows the selected user

        return render_template('home.html', user=user)
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        if check_password(username, password):
            user = get_user(username)
            # Convert 'id' to an integer
            user_id = int(user['id'])
            session['user'] = {'id': user_id, 'username': username}
            return redirect(url_for('home'))

        return render_template('login.html', message='Invalid username or password')

    return render_template('login.html')

def hash_password(password):
    result = bcrypt.hashpw(password.encode('utf-8'), str(bcrypt.gensalt()))
    return result

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        phone = request.form['phone']
        password = request.form['password']
        password = hash_password(password)

        if add_user(username, phone, password):
           return redirect(url_for('login'))
    
        return render_template('register.html', message='Cannot Register')
    
    return render_template('register.html')
        

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)



