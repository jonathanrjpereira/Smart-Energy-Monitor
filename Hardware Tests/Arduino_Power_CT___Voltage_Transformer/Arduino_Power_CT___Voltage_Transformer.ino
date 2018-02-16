
float zeroPowerCurrent = 0.05;
float ct = A0;
float voltTransformer = A1;
float power;


void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(ct,INPUT);
pinMode(voltTransformer,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
float volt = getVoltage();
Serial.print("AC Voltage: ");
Serial.println(volt);
float current = getCurrent();
//Serial.println(current); //zeroPowerCurrent when no load is ON

if (current>zeroPowerCurrent)
{
  float power = volt * current;
  Serial.print("Power: ");
  Serial.println(power);
  Serial.println();
}

else 
{
  Serial.print("Power: 0 ");
  Serial.println();
}
}
