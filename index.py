import os
from flask import Flask
from dotenv import load_dotenv 
from flask import render_template
from sqlalchemy import create_engine

load_dotenv()

DATABASE_URI = f"mysql+pymysql://{os.getenv('DB_USER')}:{os.getenv('DB_PASS')}@unmute-db:3306/unmute"

engine = create_engine(DATABASE_URI)

app = Flask(__name__)

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
    return render_template('home.html')

@app.route("/exercise/<title>")
def exercise(title):
    return render_template('exercise_templ.html', title = title)

@app.route("/list_exercises")
def list():
    return render_template('exercises_list.html')