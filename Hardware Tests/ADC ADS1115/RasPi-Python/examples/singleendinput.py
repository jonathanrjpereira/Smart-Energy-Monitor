# Simple demo of single ended conversion of channel 0 & its respective voltage value.
# Author: Jonathan Pereira
# License: Public Domain
import time

# Import the ADS1x15 module.
import Adafruit_ADS1x15


# Create an ADS1115 ADC (15-bit) instance.
adc = Adafruit_ADS1x15.ADS1115()

# Or create an ADS1015 ADC (12-bit) instance.
#adc = Adafruit_ADS1x15.ADS1015()

# Note you can change the I2C address from its default (0x48), and/or the I2C
# bus by passing in these optional parameters:
#adc = Adafruit_ADS1x15.ADS1015(address=0x49, busnum=1)

# Choose a gain of 1 for reading voltages from 0 to 4.09V.
# Or pick a different gain to change the range of voltages that are read:
#  - 2/3 = +6.144V
#  -   1 = +4.096V
#  -   2 = +2.048V
#  -   4 = +1.024V
#  -   8 = +0.512V
#  -  16 = +0.256V
# See table 3 in the ADS1015/ADS1115 datasheet for more info on gain.
channel = 0 # ADC Channel set to 0.
GAIN = 2/3
LSB = 0.0001875

#For Single Ended Conversion, the single ended inputs can, by definition,
#only measure positive voltages. Without the sign bit, you only get an effective 15 bit resolution or 32768 levels.

#Example: If the Gain is set to 2/3, the ADC can measure only a positive voltage,
#ranging from 0V to 6.144V. Hence 1 level(raw value) = 0.0001875V.

while  True:
    raw_value = adc.read_adc(channel, gain=GAIN)
    voltage = raw_value * LSB
    print(raw_value)
    print(voltage)
