package com.lec.ex2_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Ex01_HashMap {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("aaa");
		list.add("aaaa");
		System.out.println(list.get(0) + "/" + list.get(1)); // 인덱스가 key
		HashMap<Integer, String> hashMap = new HashMap<Integer, String>();
		hashMap.put(11, "str11"); // 데이터는 중복되도 상관 없음
		hashMap.put(12, "str11"); // key는 중복 X 유일 해야함.
		hashMap.put(20, "str20");
		hashMap.put(33, "str33");
		System.out.println(11 + " key값의 데이터는 " + hashMap.get(11));
		System.out.println(hashMap);
		hashMap.remove(12); // remove 할때는 key 값을 지워야 한다.
		System.out.println("remove 후 : " + hashMap);
		hashMap.clear(); // 모든 데이터 제거
		System.out.println(hashMap.isEmpty() ? "데이터 모두 제거" : "데이터 있음");
		// 출력 방법
		hashMap.put(0, " Hong gildong");
		hashMap.put(10, " kim dongil");
		hashMap.put(22, " Lee sonnsin");
		hashMap.put(40, " Yu ain");
		Iterator<Integer> iterator = hashMap.keySet().iterator(); // 반복자
		while(iterator.hasNext()) {
			Integer key = iterator.next();
			System.out.println(key + " 의 데이터는" + hashMap.get(key));
 		}
	}
}