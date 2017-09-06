package _6Classes;

/**
 * Created by admin on 2017/7/17.
 */
public class TestValueOf {
    public static void main(String[] args) {
        Dog dog = new Dog();
        System.out.println(String.valueOf(dog));//等同于dog的toString方法
        System.out.println(dog.toString());
    }
}

class Dog {
    int age;
    int weight;
}