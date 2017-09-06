package _7collections;

import javax.sound.midi.Soundbank;
import java.util.ArrayList;
import java.util.List;

public class TestArrayList1 {
    public static void main(String[] args) {
        List list1 = new ArrayList();
        list1.add(1);
        list1.add(2);
        list1.add(3);
        list1.add(2);
        System.out.println(list1);
//        list1.set(3, 4);//将下标为3的值返回，并将下标为3的值设置为4，此时list为[1,2,3,4]
        System.out.println(list1.set(3, 4));
        System.out.println(list1);
        list1.add(2, 0);//将下标为2的值设置为0，并将原集合中下标为2的元素下标后移一位
        System.out.println(list1);//[1, 2, 0, 3, 4]
        list1.add(3, 2);
        System.out.println(list1);//[1, 2, 0, 2, 3, 4]
        System.out.println(list1.indexOf(2));
        System.out.println(list1.lastIndexOf(2));
        list1.remove(2);//删除下标为2的值
        System.out.println(list1);
    }
}
