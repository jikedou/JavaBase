package _6Classes;

import java.io.File;
import java.io.IOException;

public class TestFile {
    public static void main(String[] args) {
        String separator = File.separator;
        String dir = "haha" + separator + "hehe";//此处的separator通用与windows和Linux，所以建议这样写
        //String dir = "haha/hehe";//也可以这样写
        String name = "hello.txt";
        File file = new File(dir, name);//切记显示路径，后是文件名，没有路径哪来文件名？
        if (file.exists()) {
            System.out.println(file.getAbsolutePath());//如果文件存在，则打印文件的绝对路径
            System.out.println("文件的大小是:" + file.length());
        } else {
            file.getParentFile().mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
