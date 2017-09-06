package oopback;
public class ThreadTest {
	public static void main(String[] args) {
		// 先获取当前线程的名字
		String name = Thread.currentThread().getName();
		System.out.println("线程" + name + "在执行");
		// 创建线程对象
		MyThread mt = new MyThread();
		// 启动线程
		mt.start();
		for (int i = 0; i < 100; i++) {
			System.out.println("线程" + name + "在执行" + i);
		}
	}
}

// MyThread是一个线程类，集成Thread类
class MyThread extends Thread {
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		for (int i = 0; i < 100; i++) {
			System.out.println("线程" + getName() + "在执行" + i);
		}
	}
}
