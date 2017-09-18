package _9Thread;

/**
 * Created by admin on 2017/9/18.
 */
public class _9TestThreadDeadLock implements Runnable {
    int flag = 0;
    static Object o1 = new Object();
    static Object o2 = new Object();

    public static void main(String[] args) {
        _9TestThreadDeadLock ttdl1 = new _9TestThreadDeadLock();
        _9TestThreadDeadLock ttdl2 = new _9TestThreadDeadLock();
        ttdl1.flag = 1;
        ttdl2.flag = 2;
        Thread t1 = new Thread(ttdl1);
        Thread t2 = new Thread(ttdl2);
        t1.start();
        t2.start();
    }

    @Override
    public void run() {
        if (flag == 1) {
            synchronized (o1) {
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("t1在运行");
                synchronized (o2) {
                    System.out.println("o2在o1运行");
                }
            }
        }
        if (flag == 2) {
            synchronized (o2) {
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("t2在运行");
                synchronized (o1) {
                    System.out.println("o1在o2运行");
                }
            }
        }
    }
}
