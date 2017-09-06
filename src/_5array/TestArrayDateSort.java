package _5array;

/**
 * Created by jd on 17-7-2.
 */
public class TestArrayDateSort {
    public static void main(String[] args) {
        Date date1 = new Date(2001, 11, 3);
        Date date2 = new Date(2002, 11, 3);
        if (date1.compare(date2) == 1) {
            System.out.println("date1大于date2");
        }else if (date1.compare(date2) == 0) {
            System.out.println("date1小于date2");
        }

    }

}
class Date{
    int year;
    int month;
    int day;

    public Date(int year,int month,int day) {
        this.year=year;
        this.month=month;
        this.day=day;
    }

    public int compare(Date date) {
        if (this.year > date.year) {
            return 1;
        } else if (this.year == date.year) {
            if (this.month > date.month) {
                return 1;
            } else if (this.month == date.month) {
                if (this.day > date.day) {
                    return 1;
                } else if (this.day == date.day) {
                    return 0;
                }
                return 0;
            }
            return 0;
        }
        return 0;
    }
}
