package _3oop;

public class TestEquals {
	public static void main(String[] args) {
		String s1 = "hello";
		String s2 = "hello";
		String s3 = "Hello";
//		System.out.println(s1 == s2);// t
//		System.out.println(s1 == s3);// f
//		System.out.println(s2 == s3);// f
//		System.out.println(s1.equals(s2));// t
//		System.out.println(s1.equals(s3));// f
//		System.out.println(s2.equals(s3));// f
		Tree t1 = new Tree(1,2);
		Tree t2 = new Tree(1,2);
		System.out.println(t1.equals(t2));// f,重写equals方法后结果为t
	}
}

class Tree {
	int age;
	int height;
	/**
	 * 重写equals方法
	 */
	public boolean equals(Object obj) {
        if (obj==null) {
			return false;
		}else if (obj!=null) {
			obj=(Tree)obj;
			if (age==this.age&&height==this.height) {
				return true;
			}
		}
		return false;
    }
	public Tree(int age,int height){
		this.age=age;
		this.height=height;
	}
}
