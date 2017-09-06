package _4exception;

public class TestException {
    public static void main(String[] args) {
        int[] arr = {1,2,3};
//        System.out.println(arr[4]); 数组下标越界 java.lang.ArrayIndexOutOfBoundsException
        System.out.println(arr[2]);
        try {//
            System.out.println(arr[6]);
        } catch (Exception e) {
//            e.printStackTrace();//将异常信息打印出来
            System.out.println("系统正在维护.....");
            System.out.println(e.getMessage());//来得到有关异常事件的信息--->6
        }finally{
        	System.out.println("无论是否有异常，finally代码段都会执行");
        }
    }
}
