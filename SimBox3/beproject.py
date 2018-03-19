import csv
import time
import serial
arduino = serial.Serial('/dev/ttyACM0',9600)

def loadCsv(filename):                              #Loading dataset                                                                        
	lines = csv.reader(open(filename, "r"))
	dataset = list(lines)
	for i in range(len(dataset)):
		dataset[i] = [float(x) for x in dataset[i]]
	return dataset

##filename = 'demo.csv'
##dataset = loadCsv(filename)
##print('Loaded data file ',filename,' with ',len(dataset),' rows',filename,len(dataset))

import random                                       #Splitting dataset for testing
def splitDataset(dataset, splitRatio):
	trainSize = int(len(dataset) * splitRatio)
	trainSet = []
	copy = list(dataset)
	while len(trainSet) < trainSize:
		index = random.randrange(len(copy))
		trainSet.append(copy.pop(index))
	return [trainSet, copy]

##dataset = [[1,20,1],[2,21,0],[3,22,1]]
##splitRatio = 0.67
##train, test = splitDataset(dataset, splitRatio)
##print('Split ',len(dataset),' rows into ',train,' and ',test)

def separateByClass(dataset):
	separated = {}
	for i in range(len(dataset)):
		vector = dataset[i]
		if (vector[-1] not in separated):
			separated[vector[-1]] = []
		separated[vector[-1]].append(vector)
	return separated

##dataset = [[1,20,1], [2,21,0], [3,22,1], [4,23,0]]
##separated = separateByClass(dataset)
##print('Separated instances: ',separated)

import math
def mean(numbers):
	return sum(numbers)/float(len(numbers))

def stdev(numbers):
	avg = mean(numbers)
	variance = sum([pow(x-avg,2) for x in numbers])/float(len(numbers)-1)
	return math.sqrt(variance)

##numbers = [1,2,3,4,5]
##print('Summary of ',numbers,': mean=',mean(numbers),', stdev=',stdev(numbers))

def summarize(dataset):                             #Summarizing lines of data into data types
	summaries = [(mean(attribute), stdev(attribute)) for attribute in zip(*dataset)]
	del summaries[-1]               #removing the class indicator
	return summaries

##dataset = [[1,20,0], [2,21,1], [3,22,0]]
##summary = summarize(dataset)
##print('Attribute summaries: ',summary)

def summarizeByClass(dataset):
	separated = separateByClass(dataset)
	summaries = {}
	for classValue, instances in separated.items():
		summaries[classValue] = summarize(instances)
	return summaries

##dataset = [[1,20,1], [2,21,0], [3,22,1], [4,22,0]]
##summary = summarizeByClass(dataset)
##print('Summary by class value: ',summary)


#       //Probability formula
#
def calculateProbability(x, mean, stdev):
	exponent = math.exp(-(math.pow(x-mean,2)/(2*math.pow(stdev,2))))
	return (1 / (math.sqrt(2*math.pi) * stdev)) * exponent

##x = 71.5
##mean = 73
##stdev = 6.2
##probability = calculateProbability(x, mean, stdev)
##print('Probability of belonging to this class: ',probability)


#       //Probabilities per class
#
def calculateClassProbabilities(summaries, inputVector):
	probabilities = {}
	for classValue, classSummaries in summaries.items():
		probabilities[classValue] = 1
		for i in range(len(classSummaries)):
			mean, stdev = classSummaries[i]
			x = inputVector[i]
			probabilities[classValue] *= calculateProbability(x, mean, stdev)
	return probabilities

##summaries = {0:[(1, 0.5)], 1:[(20, 5.0)]}
##inputVector = [1.1, '?']
##probabilities = calculateClassProbabilities(summaries, inputVector)
##print('Probabilities for each class: ',probabilities)


#       //Most probable class for a single instance
#
def predict(summaries, inputVector):
	probabilities = calculateClassProbabilities(summaries, inputVector)
	bestLabel, bestProb = None, -1
	for classValue, probability in probabilities.items():
		if bestLabel is None or probability > bestProb:
			bestProb = probability
			bestLabel = classValue
	return bestLabel

##summaries={'A':[(1,0.5)], 'B':[(20,50)]}
##inputVector=[1.1,'?']
##result=predict(summaries,inputVector)
##print('The prediction is ',result)

def getPredictions(summaries, testSet):
	predictions = []
	for i in range(len(testSet)):
		result = predict(summaries, testSet[i])
		predictions.append(result)
	return predictions

##summaries = {'A':[(1, 0.5)], 'B':[(20, 5.0)]}
##testSet = [[1.1, '?'], [19.1, '?']]
##predictions = getPredictions(summaries, testSet)
##print('Predictions: ',predictions)

def getAccuracy(testSet, predictions):
	correct = 0
	for x in range(len(testSet)):
		if testSet[x][-1] == predictions[x]:
			correct += 1
	return (correct/float(len(testSet))) * 100.0

##testSet = [[1,1,1,'a'], [2,2,2,'a'], [3,3,3,'b']]
##predictions = ['a', 'a', 'a']
##accuracy = getAccuracy(testSet, predictions)
##print('Accuracy: ',accuracy)
def curr():
    line = arduino.readline()
    data = []
    data.append(line.replace('\r\n',''))
    #print data

    currDiff =  float(data[0].replace('Difference in Current:',''))
#    print currDiff
    return currDiff

def tot():
    total = 0
    for x in xrange(0,5):
        current = curr()
        total = total+current
        print ("Current",current)
    print ("Total",total)
    return total
    total = 0

def listtotal():
    arr = []
    totalval = tot()
    for i in xrange(0,5):
        arr.append([totalval])
    print arr
    return arr


def main():

	filename = 'Mar_ProjData.csv'
	#splitRatio = 0.67
	#dataset = loadCsv(filename)
	dataset = loadCsv(filename)
	#trainingSet, testSet = splitDataset(dataset, splitRatio)
	#print('Split ',len(dataset),' rows into train= ' , len(trainingSet),' and test=',len(testSet),' rows')
	#print('Training Set: ',trainingSet,' and Test Set: ',testSet)
	summaries = summarizeByClass(dataset)           #prepare model
	#print(summaries)
##	flag0=0
##	flag1=0
##	flag2=0
##	flag3=0
	#   //test model
##	while True:
##		inputset = getDiff()
##	#inputset=[[500],[100],[20],[200],[1]]
##		testSet=[]
##		for x in range(0,4):
##			testSet.append(inputset[x])       #input the diff here
##		print('Change: ',testSet[0])
##		predictions = getPredictions(summaries, testSet)
##		if predictions[0]==1:
##			flag1=~flag1
##			if flag1 == 0:
##				print('40W Bulb was switched OFF')
##			else:
##				print('40W Bulb was switched ON')
##		elif predictions[0]==2:
##			flag2=~flag2
##			if flag2 == 0:
##				print('60W Bulb was switched OFF')
##			else:
##				print('60W Bulb was switched ON')
##		elif predictions[0]==3:
##			flag3=~flag3
##			if flag3 == 0:
##				print('Drill was switched OFF')
##			else:
##				print('Drill was switched ON')
##			time.sleep(5)
	#accuracy = getAccuracy(testSet, predictions)
	#print('Accuracy: ',accuracy,'%')
	while True:
		inputset=listtotal()
		testSet=[]
		for x in range(0,4):
			testSet.append(inputset[x])
		print(testSet[0])
		predictions = getPredictions(summaries, testSet)
		if predictions[0]==1:
			string = '40W Bulb was switched ON'
		elif predictions[0]==2:
			string = '40W Bulb was switched OFF'
		elif predictions[0]==3:
			string = '60W Bulb was switched ON'
		elif predictions[0]==4:
			string = '60W Bulb was switched OFF'
		elif predictions[0]==5:
			string = 'Drill was switched ON'
		elif predictions[0]==6:
			string = 'Drill was switched OFF'
		time.sleep(0)
		return string
                


import json
from flask import Flask, make_response, request
# pip install flask

app = Flask(__name__)

@app.route("/")
def hello():
  device = main()
	# the output of which is stored in the below dictionary
  output = {
		"current1": device,
#		"current2": x
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

