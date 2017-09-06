package _3oop;

/**
 * 匿名对象
 * 
 * 调用方法有意义 调用属性没有意义，因为调用完就垃圾了
 * 1.当对对象的方法只调用一次时，可以使用匿名对象来完成，这样写比较简单
 * 如果对一个对象进行多个成员调用时，必须给这个对象起个名字
 * 2.可以将匿名对象作为实际参数进行传递
 * 
 * @author admin
 * 
 */
public class NiMingDuiXiang {
	public static void main(String[] args) {
		MiMi miMi = new MiMi();
		miMi.name = "miaomiao";
		miMi.eat(miMi);
		new MiMi().eat(new MiMi());
	}
}

class MiMi {
	String name = "huamao";
	int age;
	String color;

	public void eat(MiMi mimi) {
		System.out.println(mimi.name + "在吃鱼！");
		
		
	}

}
