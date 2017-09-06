package _5array;

/**
 * Created by jd on 17-7-8.
 */
public class TestTwoArray {
    public static void main(String[] args) {
        int a[][]={{1,2},{3,4,5},{5,6,7,8}};
        for (int i=0;i<a.length;i++) {
            for (int j=0;j<a[i].length;j++) {
                System.out.print("a["+i+"]["+j+"]="+a[i][j]+"\t");
            }
            System.out.println();
        }
    }
}
