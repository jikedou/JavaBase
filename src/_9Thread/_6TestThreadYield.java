package _9Thread;


public class _6TestThreadYield {
    private MyThread3 mt3;

    public static void main(String[] args) {
        MyThread3 mt3 = new MyThread3("1");
        MyThread3 mt31 = new MyThread3("2");
        mt3.start();
        mt31.start();
    }
}

class MyThread3 extends Thread {
   public MyThread3(String m) {
        super(m);

    }
    @Override
    public void run() {
        for (int i=0;i<100;i++) {
            System.out.println(getName()+"线程在跑"+i);
            if (i % 10 == 0) {
                yield();//当i能够被10整除，则执行yield方法，即暂时让出CPU，给其他线程执行的机会
            }
        }
    }
}