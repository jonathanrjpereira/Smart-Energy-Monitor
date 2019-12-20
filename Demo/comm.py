# Debug script for serial communication between uC and RasPi where current differnce is pre-calculated.

import serial
arduino = serial.Serial('/dev/ttyACM0',9600)


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
while 1:
    listtotal()
