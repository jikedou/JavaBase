package _3oop;

/**
 * Created by admin on 2017/5/24.
 */
public class TestInterface {
    public static void main(String[] args) {
        Student s1 = new Student();
        s1.sing();
        s1.sleep();
    }
}

interface Singer {
    public void sing();

    public void sleep();
}

interface Painter {
    public void paint();

    public void eat();
}

class Student implements Singer {
    public void study() {
        System.out.println("student--study");
    }

    @Override
    public void sleep() {
        System.out.println("student-sleep");
    }

    @Override
    public void sing() {
        System.out.println("student--sing");
    }
}

/**
 * 多个无关的类可以实现同一个接口
 */
class Student1 implements Singer {

    @Override
    public void sing() {

    }

    @Override
    public void sleep() {

    }
}

class Teacher implements Painter {
    public void teach() {
        System.out.println("teacher--teach");
    }

    @Override
    public void paint() {
        System.out.println("teacher--paint");
    }

    @Override
    public void eat() {
        System.out.println("teach--eat");
    }
}

/**
 * 一个类可以实现多个无关的接口
 */
class Tom implements Singer, Painter {

    @Override
    public void sing() {

    }

    @Override
    public void sleep() {

    }

    @Override
    public void paint() {

    }

    @Override
    public void eat() {

    }
}