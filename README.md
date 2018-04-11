# *Smart-Energy-Monitor*
Providing insights into appliance level consumption using Non Intrusive Load Monitoring.

![Demo 1](https://github.com/jonathanrjpereira/Smart-Energy-Monitor/blob/master/img/Demo1.PNG?raw=true)

## Methodology
The goal of the Smart Energy Monitor is to accurately predict the monthly electricity bill of the household using minimum hardware & by acquiring electrical data at a single location(instead of individual sensors per device). We do this by analyzing the current & power signatures of all the active devices and pass this information through a Naive Bayes classifier which helps us obtain the Active devices which can further be used to calculate the number of units consumed by individual load appliances.


## Features & Current Status
 - Hardware used to Obtain Current, Active and Reactive Power Signatures of Individual devices to create high quality datasets.
 - Detect when a particular appliance has changed its state (ON/OFF).
 - Classify the Active Load Appliances by analyzing the measured electrical signals which have been obtained from a single location.  
 
This project is still under active development. In addition to the exisiting Documentation, detailed step-by-step instructions as well as a technical paper shall be published before the end of 2018. The current active directory is SimBox3 which can be used to execute the above mentioned features.

## Prerequisites
**Hardware:**
 1. Raspberry Pi 3 or Zero W running Raspbian & Python 2.7 or above
 2. Arduino Uno/Nano/Pro Mini
 3. Current & Voltage Transformers
 4. Additional Electronic components required for the Zero Cross Detection circuit.

**Software:**
 1. Flask - Web App Microframework
 2. Dash by Plottly - Analytical Web App Framework

## Future Updates
 - Electricity Bill Prediction
 - Data Analysis for Individual Appliances
 - Better GUI & a Smartphone App
 
## Contributing
Are you a programmer, engineer or designer who has a great idea for a new feature in the Smart Energy Monitor? Maybe you have a good idea for a bug fix? Feel free to grab our code, schematics & CAD files from Github and tinker with it.
