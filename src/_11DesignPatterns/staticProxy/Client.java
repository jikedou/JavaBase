package _11DesignPatterns.staticProxy;

public class Client {
    public static void main(String[] args) {
        Star real = new RealStar();
        Star proxy = new ProxyStar(real);//代理类代理的是RealStar
        proxy.confer();
        proxy.bookTicket();
        proxy.sing();//此处的方法调用的是RealStar的sing方法
        proxy.getMoney();
    }

}
