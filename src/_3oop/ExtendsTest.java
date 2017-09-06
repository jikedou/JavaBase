package _3oop;

/**
 * 继承
 * 
 * @author jiangdou
 *
 */
public class ExtendsTest {
	public static void main(String[] args) {
		Dog1 dog = new Dog1();
		dog.setAge(2);
		// dog.set=2;//因为dog继承与动物
		System.out.println(dog.getAge());
	}
}

class Animal {
	private int age = 1;
	String name;

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}

class Dog1 extends Animal {
	String color;

}