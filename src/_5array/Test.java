package _5array;

public class Test {
    public static void main(String[] args) {
        int a = 1;
        int b = 3;
        Test test = new Test();

        int c = test.change(a, b);
//		c=a;
//		a=b;
//		b=c;
//		System.out.println(a);
        System.out.println(c);
    }

    public int change(int i, int j) {
//		int num=0;
//		num=i;
		i=i+j;
		j=i-j;
		i=i-j;
//        a = b - a; //a=2;b=12
//        b = b - a; //a=2;b=10
//        a = b + a; //a=10;b=10
        return i;
    }
}
