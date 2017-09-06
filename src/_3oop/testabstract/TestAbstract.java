package _3oop.testabstract;

public class TestAbstract {

	public static void main(String[] args) {
//		Animal animal = new Animal("aa");//抽象类不能被实例化
//		Test t1 = new Test(animal);
//		t1.testcry();
		Dog dog = new Dog("wangcai", "red");
		// dog.cry();
		Cat cat = new Cat("jiafei", "black");
		// cat.cry();
		Test t2 = new Test(dog);
		Test t3 = new Test(cat);
		t2.testcry();
		t3.testcry();
	}
}
/**
 * 抽象类
 * 1用abstract修饰的类或方法叫做抽象类或者抽象方法
 * 2抽象方法只需要声明，不需要实现
 * 3有抽象方法的类必须被声明为抽象类，抽象方法必须被重写
 * 4抽象类不能实例化
 * @author admin
 *
 */

 abstract class Animal {//有抽象方法的类必须被声明为抽象类
	private String name;

	public Animal(String name) {
		this.name = name;
	}

	public abstract void cry();//抽象方法只需声明，不需要实现
}

class Dog extends Animal {
	private String dogColor;

	public Dog(String name, String dogColor) {
		super(name);
		this.dogColor = dogColor;
	}

	public void cry() {
		System.out.println("wangwang");//抽象方法必须被重写，或者仍然让这个方法抽象
	}

}

class Cat extends Animal {
	private String catColor;

	public Cat(String name, String catColor) {
		super(name);
		this.catColor = catColor;
	}

	public void cry() {
		System.out.println("喵喵。。。。");
	}

}

class Test {
	Animal a;

	public Test(Animal a) {
		this.a = a;
	}

	public void testcry() {
		a.cry();
	}
}
