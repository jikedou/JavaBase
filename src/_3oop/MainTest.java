package _3oop;

public class MainTest {
	public static void main(String[] args) {
		String []arr={"haha","hehe","xixi"};
		Main.main(arr);
		System.out.println(args.length);
		System.out.println(args);
//		System.out.println(args[0]);//数组越界，这个数组长度为0
	}
}
class Main{
	public static void main(String[] args) {
		for (int i = 0; i < args.length; i++) {
			System.out.println(args[i]);
		}
	}
}
