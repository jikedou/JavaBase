package oopbefore;

public class SumTest {
	public static void main(String[] args) {
		int sum=0;//设定总和为0分
		double a=0.5;//设定初始值为1分
		for (int i = 1; i <= 30; i++) {
			a=a*2;
			sum+=a;
		}
		System.out.println(sum/100);//结果为10737418元
	}
}
