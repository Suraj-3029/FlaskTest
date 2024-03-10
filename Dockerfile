FROM python:3.7 AS p

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pytest


FROM p AS test

CMD ["pytest", "test.py"]

FROM p AS build

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["flask","run", "--host=0.0.0.0" ]