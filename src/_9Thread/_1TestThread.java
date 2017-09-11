package _9Thread;

public class _1TestThread {
    public static void main(String[] args) {
        a();
    }

    private static void a() {
        b();
        c();
    }

    private static void c() {
    }

    private static void b() {
        
    }
    //运行路径为main-a-b-a-c-a-main
}
