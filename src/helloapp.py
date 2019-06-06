#!flask/bin/python
from flask import Flask, jsonify

app = Flask(__name__)

hello = 'hello world!'

@app.route('/hello', methods=['GET'])
def get_hello():
	return jsonify(body=hello)

if __name__ == '__main__':
    app.run(debug=True)



