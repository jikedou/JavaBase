package _7collections;

import java.util.ArrayList;
import java.util.Collection;

/**
 * 1.5之后才有增强for循环
 */
public class TestForForFor {
    public static void main(String[] args) {
        int[] arr1 = {6, 5, 4, 3, 2, 1};
        for (int i : arr1) {
            System.out.println(i);
        }
        Collection c1 = new ArrayList();
        c1.add("one");
        c1.add("two");
        c1.add("three");
        for (Object o : c1) {
            System.out.println(o.toString());

        }
    }
}
