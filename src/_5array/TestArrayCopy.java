package _5array;

/**
 * Created by jd on 17-7-8.
 */
public class TestArrayCopy {
    public static void main(String[] args) {
        int a[]={1,2,3};
        int b[] = new int[3];
        System.arraycopy(a,0,b,0,a.length);
        for (int i = 0; i < b.length; i++) {
            System.out.print(b[i]+"\t");
        }
        System.out.println();
        a[2]=4;
        for (int i = 0; i < a.length; i++) {
            System.out.print(a[i]+"\t");
        }
        System.out.println();
        for (int i = 0; i < b.length; i++) {
            System.out.print(b[i]+"\t");
        }
    }
}
