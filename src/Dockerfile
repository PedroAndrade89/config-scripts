FROM centos:6

RUN yum install -y epel-release python-pip python-dev python-virtualenv

RUN yum update -y

ADD . /helloapp

COPY ./requirements.txt /helloapp/requirements.txt
COPY ./helloapp.py /helloapp/helloapp.py

WORKDIR /helloapp

RUN virtualenv venv
RUN . venv/bin/activate

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "gunicorn" ,"--workers=2" , "-b :5000", "helloapp:app" ]


