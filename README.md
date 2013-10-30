Arduino_SPI2
============

to show how to make SPI write/read program

基于Arduino Uno：
同时需要将IO9（PWM输出）接到MISO管脚上，因为暂时没有SPI可读设备，所以提供PWM信号供给之。
当占空比设置到接近50%（pwmValue = 125）时，SPI读回来的读数应该是忽高忽低各占一半的情况，如图SerialPort_Output.PNG
