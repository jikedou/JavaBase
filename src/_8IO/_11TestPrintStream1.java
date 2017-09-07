package _8IO;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class _11TestPrintStream1 {
    public static void main(String[] args) {
        try {
            FileOutputStream fos = new FileOutputStream("d:/javatest/printStream.txt");
            PrintStream ps = new PrintStream(fos);
            if (ps != null) {
                System.setOut(ps);//将原来打印的地方改成ps所在的位置
            }
            int ln = 0;
            for (int i = 0; i < 1000; i++) {
                System.out.print(i + "\t");
                ln++;
                if (ln > 100) {
                    System.out.println();
                    ln = 0;
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
