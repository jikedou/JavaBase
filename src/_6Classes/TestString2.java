package _6Classes;

public class TestString2 {
	/**
	 * 输出一个字符串中出现指定字符串中的次数
	 * n.indexOf(string)!=-1  判断string在n中第一次出现的下标，如果没有返回-1
	 * n.replaceFirst(string, "11"); 用11替换n中的第一个String，返回的是新的字符串
	 * @param args
	 */
	public static void main(String[] args) {
		String n = "webjavaiojavasjavaandroidjava";
		System.out.println(num(n, "java"));
	}

	private static int num(String n, String string) {
		int count=0;
		while (n.indexOf(string)!=-1) {
				count++;
				n=n.replaceFirst(string, "11");
		}
		return count;
	}
}
