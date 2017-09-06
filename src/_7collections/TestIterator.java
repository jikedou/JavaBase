package _7collections;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;

public class TestIterator {
    public static void main(String[] args) {
        Collection c1 = new HashSet();//因为set是没有顺序，不可以重复的，所以最终取出的值顺序是不一样的
        c1.add(new Name("zhangsan", 18));
        c1.add(new Name("lisi", 20));
        c1.add(new Name("wangwu", 22));
//        c1.add("haha1");
//        c1.add("haha2");
//        c1.add("haha3");
        System.out.println("遍历c1中的元素");
        Iterator i = c1.iterator();
        while (i.hasNext()) {
            Name name = (Name) i.next();
            System.out.println(name.getName() + "," + name.getAge());
        }

    }
}

class Name {
    private String name;
    private int age;

    public Name(String name, int age) {
        this.name = name;
        this.age = age;
    }

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
}
