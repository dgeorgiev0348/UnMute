import os
from flask import Flask, url_for
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv 
from flask import render_template
import json

load_dotenv()

db = SQLAlchemy()

DATABASE_URI = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASS')}@mysql-1:3306/{os.getenv('DB')}"

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

db.init_app(app)

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

    def __init__(self, level, title, name, desc):
        self.level = level
        self.title = title
        self.name = name
        self.description = desc

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
    return render_template('home.html', level1e = getExercises(1), 
                                        level2e = getExercises(2), 
                                        level3e = getExercises(3), 
                                        level4e = getExercises(4))

@app.route("/exercise/<title>")
def exercise(title):
    return render_template('exercise_templ.html', title = title)

@app.route("/list_exercises")
def list():
    return render_template('exercises_list.html')

@app.route("/test")
def test():
    return render_template('test.html')

def getExercises(levelNum):
    exercises = []
    ex = db.session.execute(db.select(Exercise).filter_by(level = levelNum)).scalars()
    
    for exercise in ex:
        url = url_for('exercise', title = exercise.title)
        exercises.append({"title":exercise.title, "name":exercise.name, "url":url})

    return json.dumps(exercises)