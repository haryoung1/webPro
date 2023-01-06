package com.lec.ex2person_dtodao;

import java.util.ArrayList;
import java.util.Scanner;

public class Person2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		PersonDao dao = PersonDao.getInstance();
		String fn;
		ArrayList<String> jobs = dao.jnamelist();
		do {
			System.out.println("1:입력 || 2:직업별조회 || 3:전체조회 || 그외:종료");
			fn = sc.next(); // 1,2,3,a
			switch (fn) {
			case "1": // 이름, 직업명, 국, 영, 수 입력받아 insert
				System.out.print("입력할 이름은? : ");
				String pname = sc.next();
				System.out.print("직업" + jobs + "은?");
				String jname = sc.next();
				System.out.print("국어점수는? : ");
				int kor = sc.nextInt();
				System.out.print("영어점수는? : ");
				int eng = sc.nextInt();
				System.out.print("수학점수는? : ");
				int mat = sc.nextInt();
				dao.insertPerson(new PersonDto(pname, jname, kor, eng, mat));
				break;
			case "2": // 직업명을 입력 받아 해당 직업별 조회 출력
				System.out.print("직업" + jobs + "은?");
				jname = sc.next();
				ArrayList<PersonDto> dtos = dao.selectJname(jname);
				if (dtos.isEmpty()) {
					System.out.println(jname + "직업군의 사람은 없습니다");
				} else {
					for (PersonDto d : dtos) {
						System.out.println(d);
					}
				}
				break;
			case "3":
				dtos = dao.selectAll();
				if (dtos.size() == 0) {
					System.out.println("등록된 사람이 없습니다");
				} else {
					for (int idx = 0; idx < dtos.size(); idx++) {
						System.out.println(dtos.get(idx));
					}
				}
			} // switch
		} while (fn.equals("1") || fn.equals("2") || fn.equals("3"));
		System.out.println("BYE");
	} // main
}