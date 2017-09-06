package _6Classes;

public class TestEnum {
    /**
     * 只能够取特定值中的一个
     */
    public enum MyColor {
        red, yellow, blue
    }

    public static void main(String[] args) {
        MyColor mc = MyColor.blue;
        switch (mc) {
            case red:
                System.out.println("这是红的");
                break;
            case blue:
                System.out.println("这是蓝的");
                break;
            case yellow:
                System.out.println("这是黄的");
                break;
        }
    }
}
