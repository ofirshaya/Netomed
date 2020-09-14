FROM python:2 
COPY . /app
WORKDIR /app
RUN apt-get update -y
RUN apt-get install python2.7-dev -y
RUN pip2.7 install --upgrade pip
RUN pip2.7 install -r requirements.txt
EXPOSE 80
CMD [ "python", "app.py" ]
