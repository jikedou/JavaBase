package _9Thread;

import java.util.Date;

public class _4TestThreadSleep {
    public static void main(String[] args) {
        MyThreadSleep mts = new MyThreadSleep();
        mts.start();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        mts.interrupt();//终端线程

    }
}

class MyThreadSleep extends Thread {
    public void run() {
        while (true) {
            System.out.println("现在是" + new Date());
            try {
                sleep(1000);
            } catch (InterruptedException e) {
                return;//当线程被中断，就跳出循环
            }
        }
    }
}
