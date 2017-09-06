package _6Classes;

public class TestString1 {
	public static void main(String[] args) {
		String s="Hello1";
		System.out.println(s);
		int a=0;//计算字符串中小写的个数
		int b=0;//计算字符串中大写的个数
		int c=0;//计算字符串中非英文字母的个数
//		for (int i = 0; i < s.length(); i++) {
//			if (s.charAt(i)>'a'&&s.charAt(i)<'z') {
//				a++;
//			}else if (s.charAt(i)>'A'&&s.charAt(i)<'Z') {
//				b++;
//			}else {
//				c++;
//			}
//			
//		}
		for (int i = 0; i < s.length(); i++) {
			if (Character.isLowerCase(s.charAt(i))) {
				a++;
			}else if (Character.isUpperCase(s.charAt(i))) {
				b++;
			}else {
				c++;
			}
		}
		System.out.println("字符串中的小写个数是"+a+"个");
		System.out.println("字符串中的大写个数是"+b+"个");
		System.out.println("字符串中的非英文个数是"+c+"个");
	}
}
/*
 * 还可以使用isUpperCase isLowerCase
 * */
