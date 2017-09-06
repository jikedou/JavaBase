package _3oop;

/**
 * Created by admin on 2017/5/23.
 */
public class TestFinal {
    public static void main(String[] args) {

    }
}
class T{//final修饰的类不能被继承
    final int a=10;


    /**
     * final修饰的方法不能被重写
     */
    public final void show() {
//        a=1;//final修饰的变量不能被改变
       System.out.println("a的值为："+a);
    }
}

class TT extends T {
//    public void show() {
//
//    }
}
