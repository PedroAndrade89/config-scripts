#!flask/bin/python
from flask import Flask, Response, jsonify
from helpers.middleware import setup_metrics
import prometheus_client 

CONTENT_TYPE_LATEST = str('text/plain; version=0.0.4; charset=utf-8')

app = Flask(__name__)
setup_metrics(app)

hello = 'hello world!'

@app.route('/hello', methods=['GET'])
def get_hello():
	return jsonify(body=hello)

@app.errorhandler(500)
def handle_500(error):
    return str(error), 500


@app.route('/metrics')
def metrics():
    return Response(
        prometheus_client.generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == '__main__':
    app.run()




