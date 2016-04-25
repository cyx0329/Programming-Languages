/*
  CSCI 5106
  Homework 1
  Yi Cai
  9/29/2013
  Program descripition: This program prompts the user to enter an integer 
  value and the to enter a list of integer values. User will need to press 
  CTRL+D(Linux System) or CTRL+Z(Window System) to indicate the end of list 
  after hit "enter" of done inputing the integer list.
*/  

/*Example output from the program in WIN7

Please enter an integer value:
0
Please enter a list of integer values:
1 2 3 4
^Z

Intersperse List: 1, 0, 2, 0, 3, 0, 4
Press any key to continue . . .

*/

#include <stdio.h>
#include <stdlib.h>

#define MAXVALS 10            //max number of values we can read

int main()
{
    int tableFill(int a[], int max);
    
    int table[MAXVALS];        //array to hold input list
    int sep;                   //value to hold input separate integer
    int n;                     //number of value in table
    int i = 0;                 //index of printing the list
    
    printf("Please enter an integer value:\n");
    scanf("%d", &sep);
	
    if(sep == '\n')
    {
              printf("Error:Please enter an integer value.");
    }

    printf("Please enter a list of integer values:\n");
    n = tableFill(table, MAXVALS);
    printf("\n");
    printf("Intersperse List: ");
   
    for(i = 0; i < n; i++)
    {
           printf("%d", table[i]);
           if(i < n-1)
           {
                printf(", ");
                printf("%d", sep);
                printf(", ");
           }
    }

    printf("\n");
    system("PAUSE");
    return 0; 
}

//This function reads in an undeterminded number of array elements.

int tableFill(int a[], int max)
{
    int next;          //next input values of a list
    int r;             //return from trying to read values
    int cnt = 0;       //count of values read from a list
    
    while((r = scanf("%d", &next)) != EOF && cnt < max)
    {
            if(r == 0)             //invalid input data
            {
                 printf("Error in the input after reading %i values.\n", cnt);
                 break;
            }
            else
                 a[cnt++] = next;
    }
            
    if(r == 1)            //another value was read, but the array is full
    {
         printf("Error - too many values. Array size is %i.\n", max);
    } 
     
    return cnt;
}
