package _6Classes;

import java.io.File;
import java.io.IOException;

/**
 * Created by admin on 2017/8/3.
 */
public class TestFile1 {
    public static void main(String[] args) {
        String separator = File.separator;
        String filepath="e:/Desktop"+separator;
        String filename = "haha.txt";
        File file = new File(filepath, filename);
        if (file.exists()) {
            System.out.println(file.getAbsolutePath());
            System.out.println(file.length());
        } else {
            file.getParentFile().mkdir();
            try {
                file.createNewFile();
                file.setWritable(false);//设置可读性为false
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

}
