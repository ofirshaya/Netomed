FROM python:2 
COPY . /app
WORKDIR /app
RUN apt-get update -y
RUN apt-get install python2-dev -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 80
CMD [ "python", "app.py" ]
