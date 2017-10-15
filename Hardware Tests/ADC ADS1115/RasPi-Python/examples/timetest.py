import time
epoch = time.time()

def millis():
   return int((time.time()-epoch)*1e3)

mv_per_amp = 66
voltage = 0
vrms = 0
arms = 0
ampOffset = 0.154166
power = 0

def getVPP():
    maxValue = 0
    minValue = 1024

     start_time = millis()
    while (millis() - start_time) < 1000:
        readValue = float(input())
        if readValue > maxValue:
            maxValue = readValue
        if readValue < minValue:
            minValue = readValue
    result = maxValue - minValue
    return result

while 1:
    voltage = getVPP()
    vrms = (voltage/2)*0.707
    arms = (vrms*1000)/mv_per_amp
    final_amp = arms - ampOffset
    power = final_amp * 240
    print(power)
