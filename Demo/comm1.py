# Debug script for serial communication between uC and RasPi with current differnce calculation.

import serial
arduino = serial.Serial('/dev/ttyACM1',9600)

ctemp = 0

def get_current():
    line = arduino.readline()
    string = float(line.replace('\r\n',''))
    return string
    #print(string)


def get_current_difference():

    global ctemp
    current = get_current()
    cdiff = current - ctemp
    ctemp = current
    return cdiff


while 1:
    current = get_current_difference()
    print(current)
