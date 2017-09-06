package _3oop;

/**
 * 静态代码块 静态隶属于类 jvm不会直接加载所有的类，只加载被调用的类，先执行静态代码块 因为类只被加载一次，所以静态代码块只能执行一次
 * 
 * 如果希望加载后，对整个类进行初始化操作，可以使用static初始化块 是在类初始化执行，不是在创建对象时执行 静态初始化块中不能访问非static成员
 * 执行顺序
 * 
 * 构造方法是为了初始化对象，静态代码块是为了初始化类
 * 
 * 静态代码块中不能出现非静态成员
 * 
 * @author admin
 * 
 */
public class StaticCodeTest {
	static{
		System.out.println("我在main方法之前");
	}
	
	public static void main(String[] args) {
		Long long1 = new Long();
		Long.test();

	}
}

class Long {
	public Long() {
		System.out.println("我是龙");
	}

	public static void test1() {
		System.out.println("哈哈");
	}

	// 静态代码块
	static {
		test1();
		System.out.println("我是静态代码块");
	}

	public static void test() {
		System.out.println("我是静态方法");
	}

}