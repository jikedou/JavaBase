package _9Thread;

/**
 * Created by admin on 2017/9/11.
 */
public class _2TestThread1 {
    public static void main(String[] args) {
        TestThread tt = new TestThread();
//        tt.run();
        Thread t = new Thread(tt);
        t.start();
        for (int i = 0; i < 100; i++) {
            System.out.println("Main:" + i);
        }

    }
}

class TestThread implements Runnable {

    @Override
    public void run() {
        for (int i = 0; i < 100; i++) {
            System.out.println("TestThread:" + i);
        }
    }
}