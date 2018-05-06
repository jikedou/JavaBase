package _7collections;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TestSort {
    public static void main(String[] args) {
        List<People> list = new ArrayList<>();
        list.add(new People(1, "zhangsan1", 22));
        list.add(new People(2, "zhangsan2", 21));
        list.add(new People(3, "zhangsan3", 20));
        list.add(new People(4, "zhangsan4", 19));
        System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }
        Collections.sort(list);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i).toString());
        }

    }
}

class People implements Comparable<People> {
    private int id;
    private String name;
    private int age;

    public People(int id, String name, int age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "People{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public int compareTo(People o) {
        int cop = age - o.getAge();
        if (cop != 0)
            return cop;
        else
            return name.compareTo(o.name);
    }
}
