# backend/app.py
from flask import Flask, render_template, request, redirect, url_for, session
from db import get_user, check_password

app = Flask(__name__, template_folder='template')
app.secret_key = b'2\xe9\x8c\xa3\xe0\xd6M\xa5$\xe7.h5\xb4v\xc6\xbaDmv\x98\x17\x9d\xe9'

@app.route('/')
def home():
    if 'user' in session:
        # Convert 'id' to an integer
        user_id = int(session['user']['id'])
        return render_template('home.html', user_id=user_id)
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

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
