# backend/app.py
from flask import Flask, render_template, request, redirect, url_for, session
from db import get_user, create_user, check_password

app = Flask(__name__, template_folder='template')
app.secret_key = b'2\xe9\x8c\xa3\xe0\xd6M\xa5$\xe7.h5\xb4v\xc6\xbaDmv\x98\x17\x9d\xe9'

@app.route('/')
def home():
    if 'user' in session:
        return render_template('user.html', user=session['user'])
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    if check_password(username, password):
        session['user'] = {'username': username}
        return redirect(url_for('home'))

    return render_template('login.html', error='Invalid username or password')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)
