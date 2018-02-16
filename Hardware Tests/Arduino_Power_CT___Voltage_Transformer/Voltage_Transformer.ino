float getVoltage()
{ 
  float zeroOffset = 0;
  float calibrateVoltage = 238; 
  float readValue1,maxValue1,result;    
   uint32_t start_time = millis();
   while((millis()-start_time) < 1000) //sample for 1 Sec
   {
       readValue1 = analogRead(voltTransformer);
       // see if you have a new maxValue
       if (readValue1> maxValue1) 
       {
           /*record the maximum sensor value*/
           maxValue1 = readValue1;
       }
   }
   
   // Convert the digital data to a voltage
  result = (maxValue1 * calibrateVoltage)/1024.0;
  return result - zeroOffset;

}

