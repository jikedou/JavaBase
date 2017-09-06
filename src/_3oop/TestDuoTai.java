package _3oop;

public class TestDuoTai {
	public static void main(String[] args) {
		Computer com = new Computer();

		Lianxiang lx = new Lianxiang();

		Dell dell = new Dell();
		Lili lili1 = new Lili(com);
		Lili lili2 = new Lili(lx);
		Lili lili3 = new Lili(dell);
		lili1.showshow();
		lili2.showshow();
		lili3.showshow();
	}
}

class Computer {
	int name;

	public void show() {
		System.out.println("这是电脑。。。");
	}
}

class Lianxiang extends Computer {
	Lianxiang() {
		super();
	}

	public void show() {
		System.out.println("这是联想电脑");
	}
}

class Dell extends Computer {
	Dell() {
		super();

	}

	public void show() {
		System.out.println("这是戴尔");
	}
}

class Lili {
	Computer com;

	public Lili(Computer com) {
		this.com = com;
	}

	public void showshow() {
		com.show();
	}
}