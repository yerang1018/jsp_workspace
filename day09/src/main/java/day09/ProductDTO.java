package day09;

public class ProductDTO {
//		IDX		NUMBER
//		NAME	VARCHAR2(100 BYTE)
//		PRICE	NUMBER
	
	private int idx;
	private String name;
	private int price;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
