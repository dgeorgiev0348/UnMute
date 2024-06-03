FROM python:3.11-slim 

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

ENV FLASK_APP=index.py

CMD ["flask", "run", "--host", "0.0.0.0"]