package _6Classes;

/**
 * Created by jd on 17-7-12.
 */
public class TestString {
    public static void main(String[] args) {
        String a = "Hello World";
        String b = "hello world";
        System.out.println(a.equals(b));//false
        System.out.println(a.equalsIgnoreCase(b));//true
        System.out.println(a.replace("ll","aa"));//Heaao World
        System.out.println(a.length());//11
        System.out.println(a.charAt(3));//l

    }
}
