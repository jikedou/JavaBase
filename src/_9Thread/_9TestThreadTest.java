package _9Thread;

/**
 * Created by admin on 2017/9/18.
 */
public class _9TestThreadTest implements Runnable {
    int a = 100;

    synchronized public void m1() throws InterruptedException {
        a = 200;
        Thread.sleep(5000);
        System.out.println("a=" + a);
    }

    public void m2() {
        System.out.println("m2,a=" + a);
    }

    @Override
    public void run() {
        try {
            m1();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        _9TestThreadTest ttt = new _9TestThreadTest();
        Thread t = new Thread(ttt);
        t.start();
        Thread.sleep(1000);

        ttt.m2();
    }
}
