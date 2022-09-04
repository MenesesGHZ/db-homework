FROM python:3.9-alpine

WORKDIR /usr/src/app

RUN python -m pip install Django && python -m pip install pymysql

COPY . .

CMD ["./manage.py", "runserver"]
