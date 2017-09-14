package _9Thread;

/**
 * Created by admin on 2017/9/14.
 */
public class _5TestThreadJoin {
    public static void main(String[] args) {
        MyThread2 mt2 = new MyThread2("mt2线程");
        mt2.start();
       /* try {
            mt2.join();//join方法可以把mt2合并到主线程中，即按照顺序来，mt2执行完了，才可以继续主线程
        } catch (InterruptedException e) {
            e.printStackTrace();
        }*/
        for (int i=0;i<10;i++) {
            System.out.println("这是主线程" + i);
        }
    }
}

class MyThread2 extends Thread {
    public MyThread2 (String m){
        super(m);
    }
    @Override
    public void run() {
        for (int i=0;i<10;i++) {
            System.out.println(getName()+i);
        }
        try {
            sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}