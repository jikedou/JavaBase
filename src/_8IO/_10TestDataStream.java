package _8IO;


import java.io.*;

public class _10TestDataStream {
    public static void main(String[] args) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream dos = new DataOutputStream(baos);
        try {
            dos.writeChar('a');//char占2个字节
            dos.writeInt(1);//int占4个字节
            dos.writeDouble(0.1);//double占8个字节
            dos.writeBoolean(true);//boolean占1个字节
            ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
            DataInputStream dis = new DataInputStream(bais);
            System.out.println("此时dis中可用的字节数为" + dis.available());//2+4+8+1=15
            System.out.println(dis.readChar());//需要注意的是按照顺序读出来的值才是正常的
            System.out.println(dis.readInt());//不按顺序读出来的是相应字节组成的值
            System.out.println(dis.readDouble());
            System.out.println(dis.readBoolean());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
