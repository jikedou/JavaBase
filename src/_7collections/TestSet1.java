package _7collections;

import java.util.HashSet;
import java.util.Set;

public class TestSet1 {
    public static void main(String[] args) {
        Set s1 = new HashSet();
        s1.add(1);
        s1.add(2);
        s1.add(3);
        s1.add(2);//因为set是没有顺序，不能重复的，所以后来添加的2是无效的
        System.out.println(s1);
    }
}
