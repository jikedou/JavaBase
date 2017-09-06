package _7collections;

import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.*;

public class TestList1 {
    public static void main(String[] args) {
        List list = new ArrayList();
        list.add(4);
        list.add(3);
        list.add(5);
        list.add(1);
        list.add(2);
        System.out.println("最初的list：" + list);
        sort(list);
        System.out.println("排序后list" + list);
        shuffle(list);
        System.out.println("乱序后list" + list);
        reverse(list);
        System.out.println("逆序后list" + list);

        List list1 = new ArrayList();
        copy(list1,list);
        System.out.println("copy后list1："+list1);

        System.out.println("二分法list："+binarySearch(list, 2));

        fill(list, "haha");//用一个特定的对象重写list容器，list容器中的所有值全变成haha
        System.out.println("重写后list" + list);
    }
}
