#include <Wire.h>
#include <Adafruit_ADS1015.h>

Adafruit_ADS1115 ads(0x48);
float Voltage = 0.0;

int sensor = 3;
int pwm = 0; //Initial Value of analog signal
int add = 5; //How many points to increase analog signal by

void setup(void) 
{
  pinMode(sensor,OUTPUT);
  Serial.begin(9600);  
  ads.begin();
}

void loop(void) 
{
  
  int16_t adc0;  // we read from the ADC, we have a sixteen bit integer as a result
  analogWrite(sensor,pwm);
  
  adc0 = ads.readADC_SingleEnded(0);
  Voltage = (adc0 * 0.1875)/1000;
  
  //Serial.print("AIN0: "); 
  //Serial.print(adc0);
  Serial.print("\tVoltage: ");
  Serial.println(Voltage);  
  Serial.println(); 
  pwm = pwm + add;
  if(pwm <=0 || pwm >=255)
  {
    add = -add;
  }
  delay(10);

}


