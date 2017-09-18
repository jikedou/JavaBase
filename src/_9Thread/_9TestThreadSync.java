package _9Thread;

import java.sql.Time;

/**
 * Created by admin on 2017/9/15.
 */
public class _9TestThreadSync implements Runnable {
    Timer timer = new Timer();
    public static void main(String[] args) {
        _9TestThreadSync tts = new _9TestThreadSync();
        Thread t1 = new Thread(tts);
        Thread t2 = new Thread(tts);
        t1.setName("t1");
        t2.setName("t2");
        t1.start();
        t2.start();
    }

//    @Override
    public void run() {
//        System.out.println("run方法运行了");
//        System.out.println(Thread.currentThread().getName()+"");
        timer.add(Thread.currentThread().getName()+"");
    }
}

class Timer {
    private static int i=0;
    synchronized public  void add(String name) {
        i++;
        try {
            Thread.sleep(1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("这个线程是"+name+",第"+i+"次");
    }

}
