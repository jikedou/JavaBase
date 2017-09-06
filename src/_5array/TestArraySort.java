package _5array;

public class TestArraySort {
	public static void main(String[] args) {
		int[] a = { 15, 4, 2, 45, 9, 11, 31 };

		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j <i; j++) {

				if (a[j] > a[j + 1]) {
					int num;
					num = a[j];
					a[j] = a[j + 1];
					a[j + 1] = num;
				}
			}
		}
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
		for (int i=0;i<args.length;i++) {
			System.out.println(args[i]);
		}
	}

}
