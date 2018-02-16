import time
epoch = time.time()

def millis():
    return int((time.time()-epoch)*1e3)

while 1:
    start_time = millis()
    print (start_time/1000)
