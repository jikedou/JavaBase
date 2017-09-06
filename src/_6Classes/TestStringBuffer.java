package _6Classes;

public class TestStringBuffer {
	public static void main(String[] args) {
		TestStringBuffer tsb = new TestStringBuffer();
		String s1 = "hello";
		String s2 = "world";
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		s1 += s2;
		System.out.println(s1.hashCode());// 此时的s1与之前的s1已经不一样了， 并且地址已经发生了改变
		
		StringBuffer sb1 = new StringBuffer("hello");
		StringBuffer sb2 = new StringBuffer("world");
		System.out.println(sb1.hashCode());
		sb1.append(sb2);
		System.out.println(sb1.hashCode());// 此时sb1与之前的sb1不一样了，但是地址还是没变，这样效率更高
		System.out.println(sb1);
		sb1.reverse();// 倒序排列,后返回
		System.out.println(sb1);
		// sb1.append(tsb);//StringBuffer的append重载方法，把后边的值换成String添加到后边
		// System.out.println(sb1);
		sb1.append(1.1);
		System.out.println(sb1);
		int a=sb2.capacity();//http://blog.csdn.net/acsuccess/article/details/70208936
		System.out.println(sb2);
		System.out.println(a);
	}
}
