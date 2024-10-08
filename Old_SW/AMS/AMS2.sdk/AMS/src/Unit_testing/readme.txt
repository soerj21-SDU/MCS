Unity prints to stdout as default. For it to work <stdlib> must be #included in the main. AND A "printf("blablabla");" must be precent before the use of Unity. 
I belive it has something to do with optimization, that if you do not use stdlib it will not be included. BUT I dont now !
According to the configuration Guide you can change the UNITY_OUTPUT_CHAR to specify a function to output. The exsample given is a RS232 exsamble. 
I have not been able to change this to use the xil_printf functions. But maybe you will. 
Please have a look at the config guide for more info. 