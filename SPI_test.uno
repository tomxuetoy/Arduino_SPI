/*
Example 34.1 - SPI bus demo using a Microchip MCP4162 digital potentiometer [http://bit.ly/iwDmnd]
http://tronixstuff.com/tutorials > chapter 34 | CC by-sa-nc | John Boxall
*/
#include <SoftwareSerial.h> 
#include "SPI.h" // necessary library
int ss=10; // using digital pin 10 for SPI slave select
int del=200; // used for various delays
byte data=0;
int pwmPin = 9;
byte pwmValue = 125;

void setup()
{
	Serial.begin(57600);
	Serial.println("Goodnight moon!");
	pinMode(ss, OUTPUT); // we use this for SS pin
	SPI.begin(); // wake up the SPI bus.
	SPI.setBitOrder(MSBFIRST);
	// our MCP4162 requires data to be sent MSB (most significant byte) first

	analogWrite(pwmPin, pwmValue);
}

void setValue(int value)
{
	digitalWrite(ss, LOW);
	SPI.transfer(0); // send command byte
	SPI.transfer(value); // send value (0~255)
	digitalWrite(ss, HIGH);  
}

void getValue()
{
	data=SPI.transfer(0x0);
	if(data == 255)
		Serial.write("high ");
	else if(data == 0)
		Serial.write("low ");
	else
		Serial.write("other value ");
}

void loop()
{
	for (int a=0; a<256; a++)
	{
		setValue(a);
		getValue();
		delay(del);
	}
	for (int a=255; a>=0; --a)
	{
		setValue(a);
		getValue();
		delay(del);
	}
}
