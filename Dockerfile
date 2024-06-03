FROM python:3.11-slim-buster AS builder

WORKDIR /app

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/unmute/unmute-venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3-slim-buster AS runner

WORKDIR /app

COPY --from=builder /unmute/unmute-venv venv
COPY index.py index.py

ENV VIRTUAL_ENV=/unmute/unmute-venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV FLASK_APP=app/app.py
EXPOSE 5000

EXPOSE 5000

ENV FLASK_APP=index.py

CMD ["flask", "run", "--host", "0.0.0.0"]