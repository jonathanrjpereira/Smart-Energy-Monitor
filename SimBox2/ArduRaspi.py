import serial
arduino = serial.Serial('/dev/ttyACM0',9600)


while 1:
    line = arduino.readline()
    data = []
    data.append(line.replace('\r\n',''))
    #print data

    currDiff =  [float(data[0].replace('Difference in Current:',''))]
    #print currDiff

    arr = []
    for i in xrange(0,5):
        arr.append(currDiff)
    
    print arr
#    return arr

