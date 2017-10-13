d = {'None': 0,
     'Charger': 5,
     'CFL': 11,
     'CFL & Charger': 16,
     'Bulb': 20,
     'CFL & CFL': 22,
     'Bulb & Charger': 25,
     'CFL & CFL & Charger': 27,
     'CFL & Bulb': 31,
     'CFL & Bulb & Charger': 36,
     'CFL & CFL & Bulb': 42,
     'CFL & CFL & Charger & Bulb': 47}
     
     
#while 1:
watt =int(input())
diff = float('inf')
for key,value in d.items():
    if diff > abs(watt-value):
        diff = abs(watt-value)
        x = key

print (x)

    
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
  watt =int(input())
  diff = float('inf')
  for key,value in d.items():
    if diff > abs(watt-value):
      diff = abs(watt-value)
      x = key
  print (x)
	# the output of which is stored in the below dictionary
  output = {
		"current1": x,
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
