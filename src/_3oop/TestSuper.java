package _3oop;

public class TestSuper {
	public static void main(String[] args) {
		Son son=new Son();
		son.f();
	}
}

class Father {
	int value = 100;

	public void f() {
		System.out.println("father的value" + value);//100
	}
}

class Son extends Father {
	int value = 200;

	public void f() {
		super.f();
		System.out.println("son的value" + value);//200
		System.out.println(value);//200
		System.out.println(super.value);//100
	}
}

/*
 * 结果是：
 * 100
 * 200
 * 200
 * 100
 */
