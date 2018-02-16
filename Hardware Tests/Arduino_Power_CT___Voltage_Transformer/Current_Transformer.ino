float getCurrent()
{ 
  float currentError = 0.0301933437;
  float rVPP;   // Voltage measured across resistor
  float nCurrThruResistorPP; // Peak Current Measured Through Resistor
  float nCurrThruResistorRMS; // RMS current through Resistor
  float nCurrentThruWire;     // Actual RMS current in Wire

  float result1;
  int readValue1;             //value read from the sensor
  int maxValue1 = 0;          // store max value here
   uint32_t start_time = millis();
   while((millis()-start_time) < 1000) //sample for 1 Sec
   {
       readValue1 = analogRead(ct);
       // see if you have a new maxValue
       if (readValue1> maxValue1) 
       {
           /*record the maximum sensor value*/
           maxValue1 = readValue1;
       }
   }
   
   // Convert the digital data to a voltage
   rVPP = (maxValue1 * 5.0)/1024.0;
  /*
   Use Ohms law to calculate current across resistor
   and express in mA 
   */
   
   nCurrThruResistorPP = (rVPP/200.0) * 1000.0;
   
   /* 
   Use Formula for SINE wave to convert
   to RMS 
   */
   
   nCurrThruResistorRMS = nCurrThruResistorPP * 0.707;
   
   /* 
   Current Transformer Ratio is 1000:1...
   
   Therefore current through 200 ohm resistor
   is multiplied by 1000 to get input current
   */
   
   nCurrentThruWire = nCurrThruResistorRMS * 1000;

   
   Serial.print("Volts Peak : ");
   Serial.println(rVPP,3);
   Serial.print("Current Through Resistor (Peak) : ");
   Serial.print(nCurrThruResistorPP,3);
   Serial.println(" mA Peak to Peak"); 
   Serial.print("Current Through Resistor (RMS) : ");
   Serial.print(nCurrThruResistorRMS,3);
   Serial.println(" mA RMS");
   Serial.print("Current Through Wire : ");
   Serial.print(nCurrentThruWire,3);
   Serial.println(" mA RMS");
   Serial.println();
   return (nCurrentThruWire/1000) + currentError;   
 } 
 
 
