package _11DesignPatterns.staticProxy;

public class ProxyStar implements Star {
    private Star star;

    public ProxyStar(Star star) {

        this.star = star;
    }

    @Override

    public void confer() {
        System.out.println("ProxyStar.confer");
    }

    @Override
    public void bookTicket() {
        System.out.println("ProxyStar.bookTicket");
    }

    @Override
    public void sing() {
       star.sing();
    }

    @Override
    public void getMoney() {
        System.out.println("ProxyStar.getMoney");
    }
}
