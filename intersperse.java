/*
  CSCI 5106
  Homework 1
  Yi Cai
  9/29/2013
  Program descripition: This program prompts the user to enter an integer 
  value and the to enter a list of integer values.
*/  

import java.util.*;

public class intersperse {

	public static void main(String[] argv) {
		Scanner s = new Scanner(System.in);
		int n = 0, sep;
		int[] lst = new int[1024];
		System.out.println("input an integer:");
		sep = s.nextInt();
		System.out.println("input a list:");
		while ((lst[n] = s.nextInt())>=0) {
			n++;
		}

		for (int i =0; i < n; i++) {
			System.out.print(lst[i]);
			if(i < n-1)
			System.out.print("," + sep + ",");
		}
	}
}
