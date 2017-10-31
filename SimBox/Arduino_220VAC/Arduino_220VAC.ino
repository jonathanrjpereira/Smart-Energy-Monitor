/*
Measuring AC Current Using ACS712
*/
const int sensorIn = A0;
int mVperAmp = 66; // use 100 for 20A Module and 66 for 30A Module


double Voltage = 0;
double VRMS = 0;
double AmpsRMS = 0;
double Amp_Offset = 0.154166;
double Power_Offset = 3;
double Power = 0;


void setup(){ 
 Serial.begin(9600);
}

void loop(){
 
 
 Voltage = getVPP();
 VRMS = (Voltage/2.0) *0.707; 
 AmpsRMS = (VRMS * 1000)/mVperAmp;
 Serial.print("Amps RMS: ");
 Serial.print(AmpsRMS - Amp_Offset);
 Power = ((AmpsRMS - Amp_Offset)*240) + Power_Offset ;
 Serial.print("   Power: ");
 Serial.println(Power);

}

float getVPP()
{
  float result;
  
  int readValue;             //value read from the sensor
  int maxValue = 0;          // store max value here
  int minValue = 1024;          // store min value here
  
   uint32_t start_time = millis();
   while((millis()-start_time) < 1000) //sample for 1 Sec
   {
       readValue = analogRead(sensorIn);
       // see if you have a new maxValue
       if (readValue > maxValue) 
       {
           /*record the maximum sensor value*/
           maxValue = readValue;
       }
       if (readValue < minValue) 
       {
           /*record the maximum sensor value*/
           minValue = readValue;
       }
   }
   
   // Subtract min from max
   result = ((maxValue - minValue) * 5.0)/1024.0;
      
   return result;
 }
