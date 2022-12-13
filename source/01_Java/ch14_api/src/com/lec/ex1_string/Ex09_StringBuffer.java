package com.lec.ex1_string;

public class Ex09_StringBuffer {
	public static void main(String[] args) {
		String str = "abc";
		StringBuffer strBuffer = new StringBuffer("abc");
		System.out.println("strBuffer의 해쉬코드 : " + strBuffer.hashCode());
		strBuffer.append("def"); // abcdef (abc에 def추가)
		System.out.println("append 후 : " + strBuffer);
		System.out.println("strBuffer의 해쉬코드 : " + strBuffer.hashCode());
		strBuffer.insert(3, "AAA"); // 3번째에 AAA가 추가됨 =  abcAAAdef
		System.out.println("insert 후 : " + strBuffer);
		System.out.println("strBuffer의 해쉬코드 : " + strBuffer.hashCode());
		strBuffer.delete(3, 6); // 3번째부터 6번째 앞까지
		System.out.println("delete 후 : " +strBuffer);
		int capacitySize = strBuffer.capacity(); // Buffer의 가용크기
		System.out.println("Buffer의 가용크기  : " + capacitySize);
		strBuffer.append("abcdefghijklmnopqrstuvwxyz01234567454894");
		System.out.println("append 후  " + strBuffer );
		System.out.println("해쉬코드  : "+ strBuffer.hashCode());
		System.out.println("많은 문자를 추가한 후 가용 크기 :" + strBuffer.capacity());
	}
}
