package _7collections;

import java.util.ArrayList;
import java.util.List;

public class TestFanXing {
	public static void main(String[] args) {
		List<String> list = new ArrayList();
		list.add("haha");
		list.add("1");
		List list1 = new ArrayList<String>();//
		list1.add("haha");
		list1.add(1);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		System.out.println("+++++++++++");
		System.out.println("这两个list有什么区别呢，在泛型方面");
		System.out.println("加了泛型，相当于给集合规定了元素的类型");
		System.out.println("+++++++++++");

		for (int i = 0; i < list1.size(); i++) {
			System.out.println(list1.get(i));
		}
	}
}