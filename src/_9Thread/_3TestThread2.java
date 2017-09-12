package _9Thread;

public class _3TestThread2 {
    public static void main(String[] args) {
        MyThread myThread = new MyThread();
        myThread.start();

        for (int i=0;i<100;i++) {
            System.out.println("MainThread:============"+i);
        }
    }
}

class MyThread extends Thread {
    public void run() {
        for (int i=0;i<100;i++) {
            System.out.println("MyThread:"+i);
        }
    }
}
