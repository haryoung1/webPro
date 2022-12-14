package com.lec.quiz;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
import java.util.StringTokenizer;

public class MemberTestMain_printwriter {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String answer, name, phone, birthStr, address;
		int year, month, day;
		Date birthday;
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now);
		ArrayList<Member> members = new ArrayList<Member>();

		do {
			System.out.println("회원가입 하시겠습니까? Y / 종료: n ");
			answer = sc.next();
			if (answer.equalsIgnoreCase("n")) {
				break;
			} else if (answer.equalsIgnoreCase("y")) {
				System.out.println("이름을 입력 해주세요.");
				name = sc.next();
				System.out.println("전화번호를 입력 해주세요.");
				phone = sc.next();
				System.out.println("생일을 입력 해주세요.ex: 2000-11-11");
				birthStr = sc.next();
				StringTokenizer token = new StringTokenizer(birthStr, "-");
				if (token.countTokens() == 3) {
					year = Integer.parseInt(token.nextToken());
					month = Integer.parseInt(token.nextToken());
					day = Integer.parseInt(token.nextToken());
					birthday = new Date(new GregorianCalendar(year, month - 1, day).getTimeInMillis());
				} else {
					System.out.println("생일 정보가 틀렸어요");
					continue;
				}
				if (today.equals(birthStr.substring(birthStr.indexOf("-") + 1))) {
					System.out.println(name + "님 오늘 생일이시군요. 축하 드립니다 !");
				}
				System.out.println("주소를 입력 하세요");
				sc.nextLine();
				address = sc.nextLine();
				members.add(new Member(name, phone, birthday, address));
			}
		} while (true);
		PrintWriter printWriter = null;
		try {
			printWriter = new PrintWriter("D:\\webPro1\\source\\01_Java\\ch17_io\\src\\com\\lec\\quiz\\member.txt");
			for (Member member : members) {
				System.out.print(member);
				printWriter.print(member.toString());
				String msg = String.format("\n\t\t\t.....이하 %d명 가입", members.size());
				System.out.println(msg);
				printWriter.print(msg);
			}
		} catch (FileNotFoundException e) {
			System.out.println("파일 못 찾음" + e.getMessage());
		} finally {
			printWriter.close();
		}

	}
}