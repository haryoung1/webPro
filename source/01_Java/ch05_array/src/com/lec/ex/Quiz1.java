package com.lec.ex;
// 배열에 담긴 값을 더하는 프로그램을 작성
public class Quiz1 {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50};
		int sum = 0;
		for(int i=0 ; i<arr.length ; i++) {
			sum += arr[i];
		}
		System.out.print("총합은? : " + sum);
	}
}
