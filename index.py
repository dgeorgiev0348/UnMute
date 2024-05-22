import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv 
from flask import render_template

load_dotenv()

db = SQLAlchemy()

DATABASE_URI = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASS')}@unmute-mysql-1:3306/{os.getenv('DB')}"

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db.init_app(app)

# socks = db.session.execute(db.select(Sock).filter_by(style='knee-high').order_by(Sock.name)).scalars()
# https://python-adv-web-apps.readthedocs.io/en/latest/flask_db2.html

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String)
    password = db.Column(db.String)

class Exercise(db.Model):
    __tablename__ = 'exercises'
    id = db.Column(db.Integer, primary_key=True)
    level = db.Column(db.Integer)
    title = db.Column(db.String)
    name = db.Column(db.String)
    description = db.Column(db.String)

@app.route("/")
def main_page():
    return render_template('main.html')

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/register")
def register():
    return render_template('register.html')

@app.route("/home")
def home():
    #https://stackoverflow.com/questions/44221256/flask-python-list-to-javascript
    level1 = db.session.execute(db.select(Exercise).filter_by(level = 1)).scalars()

    return render_template('home.html', level1 = level1)

@app.route("/exercise/<title>")
def exercise(title):
    return render_template('exercise_templ.html', title = title)

@app.route("/list_exercises")
def list():
    return render_template('exercises_list.html')