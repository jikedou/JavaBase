package _3oop;

public class ThisTest {
	public static void main(String[] args) {
		People p1 = new People(20);
		People p2 = new People(25);
		boolean b = p1.compare(p2);
		System.out.println(b);

	}
}

/**
 * 需求：给人定义一个用于比较年龄是否相同的功能，也就是是否是同龄人
 * 
 * this的应用 当定义类中函数时，该函数内部要用到调用该函数的对象时，这是用this来表示这个对象。 但凡本类功能内部使用了本类对象，都用this表示
 * 
 * @author admin
 *
 */
class People {
	private int age;
	private String name;

//	public People() {
//		// TODO Auto-generated constructor stub
//	}

	public People(int age) {
		this.age = age;
//		this();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean compare(People p) {
		return this.age == p.age;
	}

}
