package com.lec.ex4.product;

public class ProdductMain {
	public static void main(String[] args) {
		System.out.println(Product.count);
		Product.staticMethod();
		Product p1 = new Product();
		p1.infoPrint();
		Product p2 = new Product();
		p2.infoPrint();
		System.out.println("static 변수 : " + Product.count);
		System.out.println("static 변수 : " + p1.count);
		System.out.println("static 변수 : " + p2.count);
	}
}
