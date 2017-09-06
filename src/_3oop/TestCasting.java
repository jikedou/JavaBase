package _3oop;

public class TestCasting {
	public static void main(String[] args) {
		Paper p = new Paper(1);
		Money m = new Money(2, 2);
		Book b = new Book(3, 4);
		System.out.println(p instanceof Paper);//t
		System.out.println(m instanceof Paper);//t
		System.out.println(b instanceof Paper);//t
		System.out.println(p instanceof Money);//f
		p=new Money(4, 5);
		System.out.println(p.weight);//可以正常访问
//		System.out.println(p1.price);//会报错——————————-一个基类的引用不可以访问其子类对象新增加的成员（属性和方法）
		System.out.println(p instanceof Paper);
		System.out.println(p instanceof Money);
		Money m1=(Money)p;//强制类型转换
		System.out.println(m1.price);
	}
}

class Paper {
	int weight;

	public Paper(int weight) {
		this.weight = weight;
	}
}

class Money extends Paper {

	public int price;

	public Money(int weight, int price) {
		super(weight);
		this.price = price;
	}
}

class Book extends Paper {
	int page;

	public Book(int weight, int page) {
		super(weight);
		this.page = page;
	}
}