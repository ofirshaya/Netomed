FROM python:2.7 
COPY . /app
WORKDIR /app
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/site-packages"
RUN apt-get update -y
RUN pip2.7 install --upgrade pip
RUN pip2.7 install Flask
RUN pip2.7 install requests
EXPOSE 80
CMD python2.7 app.py
