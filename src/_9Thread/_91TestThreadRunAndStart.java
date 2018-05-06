package _9Thread;

public class _91TestThreadRunAndStart {
    public static void main(String[] args) {
        MyThread11 mt1 = new MyThread11();
        MyThread12 mt2 = new MyThread12();
//        mt1.run();
//        mt2.run();
        Thread t1 = new Thread(mt1);
        Thread t2 = new Thread(mt2);
//        t1.start();
//        t2.start();

    }
}

class MyThread11 implements Runnable {

    @Override
    public void run() {
        for (int i = 1; i < 100; i++) {
            System.out.println("MyThread1线程------" + i);
        }
    }
}

class MyThread12 implements Runnable {

    @Override
    public void run() {
        for (int i = 1; i < 100; i++) {
            System.out.println("MyThread2线程------" + i);
        }
    }
}


