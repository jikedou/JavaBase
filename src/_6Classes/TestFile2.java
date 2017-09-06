package _6Classes;

import java.io.File;

/**
 * Created by admin on 2017/8/3.
 */
public class TestFile2 {
    public static void main(String[] args) {
        show("e:/game/");

    }

    public static void show(String pathname) {
        File f = new File(pathname);
        File[] farr = f.listFiles();
        for (File n : farr) {
            if (n.isDirectory()) {
                System.out.println(n.getName());
                show(n.toString());
            } else if (n.isFile()){
                System.out.println(n.getName());
            }
        }
    }
}
