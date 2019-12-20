# Simple dummy value generator for HTML Dashboard UI

import json
from flask import Flask, make_response, request
import datetime

app = Flask(__name__)

@app.route("/")

def hello():
	# Fixed values for current drawn by two devices
	output = {
		"current1": "20 A",
		"current2": "30 A"
	}

	# Get the realtime date/time information.
	cur = datetime.datetime.now()
	output['time'] = str(cur)

	# Encode data into json
	response = json.dumps(output)

	if 'callback' in request.args:
		callback =	request.args['callback']
		response = callback + "("+response+");"

	return response


if __name__ == "__main__":
    app.run()
