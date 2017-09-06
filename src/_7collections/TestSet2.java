package _7collections;

import java.util.HashSet;
import java.util.Set;

public class TestSet2 {
    public static void main(String[] args) {
        Set s1 = new HashSet();
        s1.add(1);
        s1.add(2);
        s1.add(3);
        Set s2 = new HashSet();
        s2.add(2);
        s2.add(3);
        s2.add(4);
        Set sa = new HashSet(s1);
        System.out.println(sa);
        sa.retainAll(s2);//sa中仅保留两者的交集
        System.out.println(sa);
        s1.add(s2);//s2作为元素添加到s1中
        s1.addAll(s2);//将s2中的元素添加到s1中，因为set为不能重复的，所以会去掉重复的
        System.out.println(s1);

    }
}
