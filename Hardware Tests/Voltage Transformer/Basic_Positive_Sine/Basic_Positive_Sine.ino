int transformer = A1;

void setup()
{
  Serial.begin(9600); 
  pinMode(transformer,INPUT); 
  
}

void loop()
{
  float  volt = getVoltage();
  Serial.println(volt);
}


float getVoltage()
{ 
   float readValue1,maxValue1,result;    
   uint32_t start_time = millis();
   while((millis()-start_time) < 1000) //sample for 1 Sec
   {
       readValue1 = analogRead(transformer);
       // see if you have a new maxValue
       if (readValue1> maxValue1) 
       {
           /*record the maximum sensor value*/
           maxValue1 = readValue1;
       }
   }
   
   // Convert the digital data to a voltage
  result = (maxValue1 * 244.0)/1024.0;
  return result;
 } 
