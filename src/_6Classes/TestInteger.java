package _6Classes;

public class TestInteger {
	/**
	 * 总结：写程序有时候不能一气呵成，但是不能一句不写
	 * 要想到哪里写到哪里，编写边改， 编写边调试
	 * 切记，不能眼高手低！！！
	 * @param args
	 */
	public static void main(String[] args) {
		String string = "1,2;3,4,5,6;7,8,9";// 原始的字符串
		String[] a = string.split(";");// 原始字符串按照;分割，放到数组中
		Double[][] arr = new Double[a.length][];// 给出一维的长度
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
			String[] b = a[i].split(",");
			arr[i] = new Double[b.length];// 给出二维的长度

			for (int j = 0; j < b.length; j++) {
				arr[i][j] = Double.parseDouble(b[j]);// 把二维数组的值赋进去
			}
		}
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + "\t");
			}
			System.out.println();
		}

	}
}
