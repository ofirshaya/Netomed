FROM python:2.7 
COPY . /app
WORKDIR /app
RUN apt-get update -y
RUN pip2.7 install --upgrade pip
RUN pip2.7 install Flask
RUN pip2.7 install requests
EXPOSE 80
CMD [ "python2.7", "app.py" ]
