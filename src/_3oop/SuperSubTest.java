package _3oop;

public class SuperSubTest {
	public static void main(String[] args) {
//		SubClass subClass1=new SubClass();
		SubClass subClass2 = new SubClass(200);
	}
}
class SuperClass{
	private int n;
	public SuperClass(){
		System.out.println("SuperClass");
	}
	public SuperClass(int n){
		System.out.println("SuperClass:"+n);
	}
	
}
class SubClass extends SuperClass{
	private int n;
	public SubClass(){
//		super(100);
		System.out.println("SubClass");
	}
	public SubClass(int n){
		System.out.println("SubClass:"+n);
	}
}
/**
继承之中的构造方法[规则]，一定要背会理解！！！！！！！！！！！！！！！！！！！！！！！！！！！
子类的构造过程中！！！必须!!!调用其基类(父类)的构造方法
子类可以在自己的构造方法中使用super(argument_list)调用基类的构造方法
	1使用this(argument_list)调用本类的另外的构造方法
	2如果调用了super，必须写在子类构造方法的第一行！！！！！！
如果子类的构造方法中没有显示的调用基类构造方法，则系统默认调用基类无参的构造方法
如果子类构造方法中既没有显示调用基类构造方法，而基类中有没有无参的构造方法，则编译出错
*/