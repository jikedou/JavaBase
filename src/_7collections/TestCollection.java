package _7collections;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class TestCollection {
    public static void main(String[] args) {
        //父类引用指向子类对象
        Collection c = new ArrayList<>();
        //可以放入不同类型的对象
        c.add(1);
        c.add(new Integer("121345"));
        c.add("hello");
        System.out.println(c);//[1, 121345, hello]
        System.out.println(c.contains("hello"));
        Collection c1 = new ArrayList();
        Collection c2 = new ArrayList();
        c1.add(1);
        c1.add(2);
        c1.add(3);
        c1.add(4);

        c2.add(4);
        c2.add(5);
        c2.add(6);

        System.out.println(c1.size());//c1的长度
        System.out.println(c1.contains(2));
        System.out.println(c1.isEmpty());//判断c1是否为空
        c1.remove(2);
        System.out.println("这是c1："+c1);

//        c1.addAll(c2);//将c2添加到c1中
//        System.out.println(c1);
//        c1.contains(c2);
//        System.out.println(c1);
        System.out.println(c1.containsAll(c2));
        c1.remove(c2);
        System.out.println(c1);
        c1.retainAll(c2);//取交集
        System.out.println(c1);
        System.out.println(c1.toArray().toString());
        Collection c3 = new ArrayList<>();
        c3.add(7);
        c3.add(8);
        c3.add(9);
        Object[] arr = c3.toArray();
        System.out.println("c3：" + c3);
        for (int i = 0; i < arr.length; i++) {
            System.out.println("数组的值：" + arr[i]);
        }

    }

}

class Stu {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Stu{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public Stu(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
