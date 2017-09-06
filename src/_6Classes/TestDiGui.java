package _6Classes;

/**
 * Created by admin on 2017/8/3.
 * 递归算法
 */
public class TestDiGui {
    public static void main(String[] args) {
        System.out.println(jisuan(4));
    }

    private static int jisuan(int i) {
        if (i == 1) {
            return 1;
        }
        return jisuan(i - 1) + i;
    }
}
