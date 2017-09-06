package _6Classes;

import java.io.File;

/**
 * Created by admin on 2017/8/3.
 */
public class TestFile4 {
    public static void main(String[] args) {
        String pathname = "e:/game";
        File file = new File(pathname);
        String[] list = file.list();
        System.out.println("file.list()-------" + list[1]);//我的世界
        File[] files = file.listFiles();
        System.out.println("file.listFiles()-------" + files[1]);//e:\game\我的世界

    }
}
