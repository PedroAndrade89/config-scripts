FROM python:3

ADD . /helloapp

COPY ./requirements.txt /helloapp/requirements.txt
COPY ./helloapp.py /helloapp/helloapp.py

WORKDIR /helloapp

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "gunicorn" ,"--workers=2" , "-b :5000", "helloapp:app" ]
