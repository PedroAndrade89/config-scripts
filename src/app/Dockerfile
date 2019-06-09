FROM python:3

ADD . /helloapp
ADD . /helloapp/helpers

COPY ./requirements.txt /helloapp/requirements.txt
COPY ./helloapp.py /helloapp/helloapp.py
COPY ./helpers/middleware.py /helloapp/helpers/middleware.py

WORKDIR /helloapp

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "gunicorn" ,"--workers=2" , "-b :5000", "helloapp:app" ]
