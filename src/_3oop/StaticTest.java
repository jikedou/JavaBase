package _3oop;


public class StaticTest {
	public static void main(String[] args) {
		Dog dog = new Dog();
		System.out.println(dog.name);
	}

}
class Dog{
	public String name="旺财";
	public static int age=1;
	public static String color="red";
	public static void  eat(){
		System.out.println("在吃饭");
//		System.out.println("这是名字："+name);//在static方法中不能访问非static的成员
	}
}