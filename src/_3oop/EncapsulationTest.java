package _3oop;

//import com.sun.org.apache.regexp.internal.recompile;

/**
 * 封装：隐藏对象的属性和实现细节，仅对外提供公共访问方式 好处：1将变化隔离2便于使用3提高重用性4提高安全性
 * 原则：1将不需要对外提供的内容都隐藏起来2把属性都隐藏，提供公共方法对其访问 函数就是java中最小的封装体 注意：私有仅仅是封装的一种表现形式
 * 
 * 
 * private ：私有，权限修饰符：用于修饰类中的成员（成员变量，成员函数），私有只在本类中有效
 * 
 * @author admin
 * 
 */
public class EncapsulationTest {
	public static void main(String[] args) {
		System.out.println("haha");
		Person p=new Person();
		p.setAge(1);
		System.out.println(p.getAge());
		p.show(11111);
	}
}

class Person {
	private int age;
	private String name;
	public void setAge(int age){
		this.age=age;
	}
	public int getAge(){
		return age;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return name;
	}
	public void show(int age ){
		System.out.println("年龄是："+age);
	}
}
