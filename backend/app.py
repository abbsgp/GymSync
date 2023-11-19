# backend/app.py
from flask import render_template
from backend import app

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/employer')
def employer_dashboard():
    return render_template('employerUser.html')

@app.route('/general')
def general_user_dashboard():
    return render_template('generalUser.html')

if __name__ == '__main__':
    app.run(debug=True)
