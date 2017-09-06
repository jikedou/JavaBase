package _3oop;

/**
 * Created by admin on 2017/5/24.
 */
public class ChoosePhone {
    public static void main(String[] args) {
        System.out.println("准备开始选择，请输入1：");
        int num = (int) (Math.random() * 100);
        if (num > 50) {
            System.out.println("走");
        } else if (num == 50) {
            System.out.println("请重新开始");
        } else {
            System.out.println("不走");
        }
    }
}
