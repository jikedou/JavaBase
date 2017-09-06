package _6Classes;

public class TestMath {
    public static void main(String[] args) {
        double a= Math.random();
        double b= Math.random();//产生一个随机数，0.0到1.0之间
        System.out.println("a="+a);
        System.out.println("b="+b);
        double c = Math.sqrt(a * a + b * b);//两个数的平方和的开方
        System.out.println("c="+c);
        double d = Math.abs(-a);//abs 返回绝对值
        System.out.println("d="+d);
        int e=2;
        System.out.println("e的5次方的值为" + Math.pow(e, 5));
        int f=10,g=12;
        System.out.println("f、g两个数中较大的是" + Math.max(f, g));
        System.out.println("f、g两个数中较小的是" + Math.min(f, g));
        System.out.println("a+2的值的四舍五入为："+Math.round(a+2));


    }
}
