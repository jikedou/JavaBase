package _8IO;

import java.io.*;

/**
 * Created by admin on 2017/9/7.
 */
public class _12TestObjectIO {
    public static void main(String[] args) {
        Test t = new Test();
        try {
            FileOutputStream fos = new FileOutputStream("d:/javatestfiles/ObjectIO.txt");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(t);
            oos.flush();
            oos.close();

            FileInputStream fis = new FileInputStream("d:/javatestfiles/ObjectIO.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);

            Test ttt =(Test)ois.readObject();
            System.out.println("ttt.age="+ttt.age);
            System.out.println("ttt.name="+ttt.name);
            System.out.println("ttt.weight="+ttt.weight);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}

/**
 * Test需要实现序列化接口，否则会报  java.io.NotSerializableException  异常
 */
class Test implements Serializable {
    String name = "zhangsan";
    int age=18;
    double weight = 20.5;
}
