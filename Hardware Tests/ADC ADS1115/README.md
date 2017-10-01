The four addresses for the ADS1115 are set by connecting the ADDR pin to SCL, SDA, GND or VDD.

| Address | Arduino       |
| --------|:-------------:| 
| 0x48    | GND           | 
| 0x49    | 5V            |   
| 0x4A    | SDA           |
| 0x4B    | SCL           |  

The input signal is connected to channel 0 of the ADC ADS1115.

# Constant Voltage Test(Arduino_3.3V)
Install the Adafruit ADS1015 Library fo Arduino.
Connect channel 0 of the ADC to 3.3V of the Arduino.


# Constant Voltage Test(Arduino_PWM)
Install the Adafruit ADS1015 Library fo Arduino.
Connect channel 0 of the ADC to Digital Pin 3 of the Arduino. By varying the PWM signal on the D3 we cn observe the change in the ADC output from 0V to 5V. The output is shown below:

![Arduino ADC ADS1115 PWM](https://github.com/jonathanrjpereira/Smart-Energy-Monitor/blob/master/img/ADS1115%20Arduino%20PWM.PNG)
