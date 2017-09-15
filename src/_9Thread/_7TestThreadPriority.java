package _9Thread;

public class _7TestThreadPriority {
    public static void main(String[] args) {
        Thread mt4 = new Thread(new MyThread4());
        Thread mt5 = new Thread(new MythThread5());
        mt4.setPriority(Thread.NORM_PRIORITY+3);
        mt4.start();
        mt5.start();
    }
}

class MyThread4 implements Runnable {

    @Override
    public void run() {
        for (int i=0;i<1000;i++) {
            System.out.println("mt4----" + i);
        }
    }
}

class MythThread5 implements Runnable {

    @Override
    public void run() {
        for (int i=0;i<1000;i++) {
            System.out.println("mt5-" + i);
        }
    }
}
