package _5array;

public class TestArray {
	public static void main(String[] args) {
		int[] a;// 栈内存
		a = new int[5];// 堆内存
		for (int i = 0; i < a.length; i++) {
			a[i] = i;
		}
		Data[] d = new Data[3];
		for (int i = 0; i < d.length; i++) {
			d[i] = new Data(2017, 6, 19);
		}
	}
}

class Data {
	int year, month, day;

	public Data(int year, int month, int day) {
		this.day = day;
		this.month = month;
		this.year = year;
	}
}
