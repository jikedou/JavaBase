package _3oop;

/**
 * 构造器 构造函数 特点1函数名与类名相同2不用定义返回值类型3不可以写return 对象创建的时候会调用与之对应的构造函数
 * 构造函数的作用：可以给对象进行初始化
 * 构造函数小细节：当一个类中没有定义构造函数时，那么系统会默认给该类加入一个空参数的构造函数，当类中自定义了构造函数，默认的构造函数就没有了
 * 注意：1默认构造函数的特点2 多个构造函数是以重载的形式存在的
 * 
 * @author Administrator
 * 
 */
public class ConstructTest {
	public static void main(String[] args) {
		Cat cat = new Cat();
		new Cat("hahq");
//		String nStr/////

	}
}

class Cat {
	String name;
	// String type;
	int age;

	// String color;
	/**
	 * 构造代码块 作用：给对象进行初始化 对象已建立就运行，而且优先于构造函数执行 和构造函数区别
	 * 构造代码块是给所有对象进行统一初始化（所有的，不同对象的共性的初始化） 而构造函数是给对应的对象初始化（单个的，分别初始化）
	 * 
	 * 构造代码块定义的是不同对象的共性初始化 不管放在哪里，优先执行
	 */
	{
		System.out.println("所有的Cat都吃鱼，不同对象的共性");
	}

	public Cat() {
		System.out.println("cat对象创建了");
	}

	public Cat(String n) {
		name = n;
		System.out.println("姓名是" + name);
	}

	public Cat(String n, int a) {
		name = n;
		age = a;
	}

	public void setName(String n) {
		name = n;
	}

	public String getName() {
		return name;
	}
}