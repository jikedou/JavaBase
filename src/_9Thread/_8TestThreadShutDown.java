package _9Thread;

import jdk.nashorn.internal.ir.Flags;

public class _8TestThreadShutDown {
    public static void main(String[] args) {
        MyThread6 mt = new MyThread6();
        Thread mt6 = new Thread(mt);
        mt6.start();
        for (int i = 0; i < 10000; i++) {
            if (i % 10 == 0 && i != 0) {
                System.out.println("main" + i);
            }
        }
        System.out.println("main thread is over");
        mt.shutdown();

    }
}

class MyThread6 implements Runnable {
    private boolean flag = true;
    int i = 0;

    @Override
    public void run() {
        while (flag == true) {
            System.out.println("mythread" + "" + i++);
        }
    }

    public void shutdown() {
        flag = false;
    }
}
