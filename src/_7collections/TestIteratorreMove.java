package _7collections;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

public class TestIteratorreMove {
    public static void main(String[] args) {
        Collection c1 = new ArrayList();//因为set是没有顺序，不可以重复的，所以最终取出的值顺序是不一样的
        c1.add(new Name("zhangsan", 18));
        c1.add(new Name("lisi", 20));
        c1.add(new Name("wangwu", 22));

        for (Iterator i = c1.iterator(); i.hasNext(); ) {
            Name name = (Name) i.next();
            if (name.getAge() < 20) {
                i.remove();
            }
        }
//        Iterator i = c1.iterator();
//        while (i.hasNext()) {
//            System.out.println(((Name) i.next()).getAge());
//        }
        System.out.println(c1);
        Collection c2 = new ArrayList();
        c2.add("hah");
        c2.add("h");
        System.out.println(c2);


    }
}
