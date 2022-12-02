package com.lec.ex;
// 클래스 : 데이터, 메소드, (생성자) setter & getter ( 클래스의 구성 )
public class Rect {
	private int width;
	private int height;
	// 생성자가 없을 경우 JVM이 자동 생성.
	public Rect() {}  // 디폴트 생성자..
	public Rect(int side) {
		width = side;
		height = side;
	}
	public Rect(int width, int height) { // 매개변수 2개짜리 생성자 함수.
		this.width = width;
		this.height = height;
	}
	public int area() {
		return width*height;
	}
	// getter & setter ( get > int > return), set ( void > this)
	public int getWidth() {
		return width;
	}
	public int getHeight() {
		return height;
	}
	public void setWidth(int width) {
		this.width = width;
	}	
	public void setHeight(int height) {
		this.height = height;
	}
}
