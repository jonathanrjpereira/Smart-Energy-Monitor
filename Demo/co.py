# Demo script for Combinatorial Optimization

import itertools
import json
from flask import Flask, make_response, request
# pip install flask
import datetime


# Demo Dataset for Combinatorial Optimization
device_list = {'Fan': 100, 'CFL': 15, 'Fridge': 1000, 'Microwave': 600 , 'Geyser': 300, 'Filter': 30, 'Oven': 500, 'Chimney': 100, 'Stove': 40}

device = device_list.keys() # List of all the NAMES of the devices. Eg: [Fan,CFL]
device_watt = device_list.values() # List of all the indiviual devices in watts Eg: [100,15]
# print device
# print device_watt

device_comb = []    # List of all device combinations. Eg: [[Fan],[CFL],[Fan,CFL]]
for a in xrange(1,len(device)+1):
    els = [list(b) for b in itertools.combinations(device, a)]
    device_comb.extend(els)
# print device_comb
# print len(device_comb)


dev_comb_string = [] # List of String of all device combinations. Eg: [Fan, CFL, Fan + CFL]
for c in device_comb:
    d = '+'.join(c)
    dev_comb_string.append(d)
# print dev_comb_string
# print len(dev_comb_string)

device_watt_comb = []   # List of all device watt rating combinations. E.g: [[100],[15],[100,15]]
for e in xrange(1,len(device_watt)+1):
    g = [list(f) for f in itertools.combinations(device_watt, e)]
    device_watt_comb.extend(g)
# print device_watt_comb
# print len(device_watt_comb)


sum_dev_watt = [] # List of sum of all device watt rating combinations. E.g: [[100],[15],[115]]
for h in device_watt_comb:
    sum_dev_watt.append(sum(h))
# print sum_dev_watt

dev_watt_comb_string = zip(dev_comb_string,sum_dev_watt)
# print dev_watt_comb_string

watt =int(input())
diff = float('inf')
for value in sum_dev_watt:  # Get the change in power consumed and label assignment
    if diff > abs(watt-value):
        diff = abs(watt-value)
        index = sum_dev_watt.index(value)
        key = dev_comb_string[index]
# print key


app = Flask(__name__)

@app.route("/")
def hello():
	# Error Calculation
  output = {
		"watt": watt,
		"key": key
	}

  # dummy data, that changes in realtime
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
