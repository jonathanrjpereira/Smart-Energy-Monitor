import json
from flask import Flask, make_response, request
# the above two are necessary,  I had some changes in idea, for
# simpler program.
# the second one is a micro-framework, install it by doing
# pip install flask

app = Flask(__name__)

@app.route("/")
def hello():
	# Do some Calculation
	# the output of which is stored in the below dictionary
	output = {
		"current1": "20 A",
		"current2": "30 A"
	}

	# dummy data, that changes in realtime
	import datetime
	cur = datetime.datetime.now()
	output['time'] = str(cur)

	# encode into json
	response = json.dumps(output)

	if 'callback' in request.args:
		callback =	request.args['callback']
		response = callback + "("+response+");"

	return response


if __name__ == "__main__":
    app.run()
