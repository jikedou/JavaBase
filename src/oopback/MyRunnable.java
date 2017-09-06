package oopback;

public class MyRunnable implements Runnable {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name = Thread.currentThread().getName();
		System.out.println(name + "线程正在运行");
		// 创建线程运行的目标对象
		MyRunnable mr = new MyRunnable();
		Thread tr=new Thread(mr);
		tr.start();
		for (int i = 0; i < 100; i++) {
			System.out.println("线程" + name + "打印" + i);
		}
	}

	public void run() {
		// TODO Auto-generated method stub
		// 获取当前线程的名字
		String name = Thread.currentThread().getName();
		for (int i = 0; i < 100; i++) {
			System.out.println("线程" + name + "打印" + i);
		}
	}

}
