package com.lec.condition;
// 실행할때마다 컴퓨터가 난수(Random)점수 발생하여 학점 출력
public class Ex07_switch_RandomHakjum {
	public static void main(String[] args) {
		// 0 < = Math.random() < 1
		// 0 < = Mats.random()*101 < 100 : 실수
		// 0 < = (int)Mats.random()*101 < 101 : 정수
		//System.out.println(int)(Math.random()*101));
		int score = (int)(Math.random()*101);
		int temp = (score==100) ? score-1 : score;
		switch(temp/10) {
		case 9:
			System.out.println(score + ", A학점"); break;
		case 8:
			System.out.println(score + ", B학점"); break;
		case 7:
			System.out.println(score + ", C학점"); break;
		case 6:
			System.out.println(score + ", D학점"); break;
		case 5: case 4: case 3: case 2: case 1: case 0:
			System.out.println(score + ", F학점"); break;
		default:
			System.out.println("유효하지 않은 점수 입니다.");
		}
		}
	}
