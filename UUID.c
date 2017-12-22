/* JASON N. SMITH - AIS ADAPTIVE SYSTEMS JUNE 2017
PROJECT PURPOSE 
Program that generates a persistent UUID randomly for
each unique computer and virtual machine.
ENJOY!*/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

//This is our Computer Structure
struct computer{
	FILE *UUID;
}computer;

char buffer[20000];

int main(){
	struct computer newComputer;
	FILE *computerFile;
	FILE *UUIDLine;
//Open the file stored on the computer, or create a new one
	computerFile = fopen("cpuid.txt", "r");

//If we have a file stored on the computer with UUID information, pick one UUID from the list and store it to the computer
	if(computerFile){
		UUIDLine = popen("sed -n 6p cpuid.txt", "r");
		fread(buffer, 100, 1, UUIDLine);
		newComputer.UUID = (FILE*)buffer;
		printf("\n%s\n", (char *)newComputer.UUID);
		fclose(computerFile);
	}

//If we don't have a file stored, create one
	if(!computerFile){
		FILE *output;
		output = popen("lsblk -o UUID", "r");
		
		fread(buffer, 100, 5, output); //Variable pointer to write to, size of each element to be read (in bytes), number of elements with size bytes, Variable to read from.
	
		FILE *out = fopen("cpuid.txt", "w");
		fprintf(out,"\n%s\n\n", buffer);
		fclose(out);

		pclose(output);
	}
return 0;
}
