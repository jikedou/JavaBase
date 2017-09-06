package _3oop;

public class OopTest {
	public static void main(String[] args) {
		Iphone iphone=new Iphone();
		iphone.call("13812341234");
		System.out.println(iphone.color);//没有赋值，值为默认初始值
		iphone.color="黑色";
		System.out.println(iphone.color);
		

	}
}

class Iphone {
	String type;
	int size;// 大小
	double price;// 价格
	String color;// 颜色

	/*
	 * 拨打电话
	 */
	public void call(String num) {
		System.out.println("正在拨号。。。。" + num);
	}

	public void game() {
		System.out.println("正在游戏中。。。");
	}

}
