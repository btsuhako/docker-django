FROM python:3.6-slim

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -yq default-libmysqlclient-dev mysql-client gcc && apt-get -y autoclean && apt-get -y autoremove

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["./wait-for-mysql.sh", "mysql", "python", "src/manage.py", "runserver", "0.0.0.0:8000"]
