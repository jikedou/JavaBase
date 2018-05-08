package _12algorithm;

public class SortTest {
    public static void main(String[] args) {
        int[] arr = {7, 6, 5, 4, 0, 9, 8, 1, 2};
        bubbleSort(arr);
//        quickSort(arr, 0, arr.length - 1);
        getArr(arr);
    }

    /**
     * 快速排序quickSort
     *
     * @param arr
     * @param left
     * @param right
     */
    private static void quickSort(int[] arr, int left, int right) {
        if (left > right) {
            return;
        }
        int i = left;
        int j = right;
        int p = arr[left];//p为参照
        while (i < j) {
            while (i < j && p < arr[j]) {
                j--;
            }
            arr[i] = arr[j];
            while (i < j && p > arr[i]) {
                i++;
            }
            arr[j] = arr[i];
        }
        //产生新的参照
        arr[i] = p;
        //递归，先来左边的
        quickSort(arr, left, i - 1);
        //递归，再来右边的
        quickSort(arr, i + 1, right);

    }

    /**
     * 冒泡排序
     *
     * @param arr
     */
    public static void bubbleSort(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int tmp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = tmp;
                }
            }
        }
    }

    /**
     * 遍历数组，并输出
     *
     * @param arr
     */
    private static void getArr(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + "\t");
        }
    }
}
