package com.lec.ex1_store;
// 추상클래스 : 하나 이상의 추상메소드를 갖고 있으면 추상 클래스다.
public abstract class HeadQuarterStore {
	private String storeName;
	public HeadQuarterStore(String storeName) {
		this.storeName = storeName;
	}
	// 추상 메소드 : 나를 상속한 클래스에서 반드시 override 해라.
	//			 메소드의 선언만 있을뿐, 구현은 없다.
	public abstract void kimchi();
	public abstract void bude();
	public abstract void bibim();
	public abstract void sunde();
	public abstract void gongi();
	public String getStoreName() {
		return storeName;
	}
}