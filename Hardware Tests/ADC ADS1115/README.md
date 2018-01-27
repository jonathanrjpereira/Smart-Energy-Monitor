<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Adafruit Python ADS1x15
Python code to use the ADS1015 and ADS1115 analog to digital converters with a Raspberry Pi or BeagleBone black.

## Installation

To install the library from source (recommended) run the following commands on a Raspberry Pi or other Debian-based OS system:

    sudo apt-get install git build-essential python-dev
    cd ~
    git clone https://github.com/adafruit/Adafruit_Python_ADS1x15.git
    cd Adafruit_Python_ADS1x15
    sudo python setup.py install

Alternatively you can install from pip with:

    sudo pip install adafruit-ads1x15

Note that the pip install method **won't** install the example code.

## Analog Input Voltage Constraints
Analog input voltages must never exceed the analog input voltage limits given in the Absolute Maximum Ratings. If a VDD supply voltage greater than 4 V is used, the ±6.144 V full-scale range allows input voltages to extend up to the supply. Although in this case (or whenever the supply voltage is less than the full-scale range; for example, VDD = 3.3 V and full-scale range = ±4.096 V), a full-scale ADC output code cannot be obtained. For example, with VDD = 3.3 V and FSR = ±4.096 V, only signals up to VIN = ±3.3 V can be measured. The code range that
represents voltages |VIN| > 3.3 V is not used in this case.

## Single Ended VS Differential Inputs
The ADS1x15 breakouts support up to 4 Single Ended or 2 Differential inputs.
Single Ended inputs measure the voltage between the analog input channel (A0-A3) and analog ground (GND).
Differential inputs measure the voltage between two analog input channels.  (A0&A1 or A2&A3).

Single Ended Inputs can only measure **Positive voltages**. Without the sign bit, you only get an
effective **15 bit resolution**.
Differential inputs can measure both **Positive and Negative voltages** providing the full **16 bit
resolution**.

## Single Ended Input Voltage Measurement
Single Ended Inputs have a resolution of only 15 bits(2^15 = 32768 levels) and can measure only positive voltages.  
The Gain values determines the maximum positive voltage that can be measured whereas the supply voltage is just the physical limit of the signal you can measure without damaging the chip.

Example: If the Gain is set to 2/3, the maximum positive voltage that can be measured is 6.144V.  
*6.144/32768 = 0.0001875 V/level* . Let us call this value LSB size.  
For different Gain values we will have different maximum measureable positive voltage(Full Scale Range) & its corresponding LSB size as shown in the table.  

| Gain | Full Scale Range | LSB Size |
| --- | --- | --- |
| 2/3 | 6.144V | 0001875 = 187.5uV |
| 1 | 4.096V | 0.000125 = 125uV |
| 2 | 2.048V | 0.0000625 = 62.5uV |
| 4 | 1.024V | 0.00003125 = 31.25uV |
| 8 | 0.512V |0.000015625 = 15.625uV |
| 16 | 0.256V | 0.0000078125 = 7.8216uV |

From this we can find the value of the Input Analog Voltage for these Gain values.  
***Input Analog Voltage =  Raw Value * LSB Size***


=======
=======
>>>>>>> d37df5d3fde82caf405d9b28107875b326bac4b0
=======
>>>>>>> d37df5d3fde82caf405d9b28107875b326bac4b0
The output of the examples in the Adafruit repository are the 16-bit signed integer ADC values.
The analog sensor that I have connected to the ADC produces an ouput between 0-5V.
Hence I have set the ADC Gain = 2/3 so that it can read a range of voltages from +/-6.144V.
2^16 = 65,536 levels. Hence 12.288/65536 = 0.0001875. Therefore 1 level = 0.1875mV
Hence when measuring any positive voltage(for gain 2/3) using the ADC, we should use the following formula:
Voltage = (Raw Value + 32768) * 0.0001875
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> d37df5d3fde82caf405d9b28107875b326bac4b0
=======
>>>>>>> d37df5d3fde82caf405d9b28107875b326bac4b0
=======
>>>>>>> d37df5d3fde82caf405d9b28107875b326bac4b0


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
