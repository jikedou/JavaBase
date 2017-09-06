package _3oop;

public class TestToString {
	public static void main(String[] args) {
		Dogg dogg=new Dogg();
		System.out.println(dogg.getClass());
		System.out.println(dogg.getClass().getName());
		System.out.println(dogg.toString());
	}

}
class Dogg{
	/*
	 * 重写toString方法
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString(){
		return "hh";
	}
}
