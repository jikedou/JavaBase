package _10Socket;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;

/**
 * Created by admin on 2017/9/19.
 */
public class _1TestClient {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("127.0.0.1", 8888);
            InputStream is = s.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            System.out.println(dis.readUTF());
            dis.close();
            s.close();
        } catch (IOException e) {
            System.out.println("连接失败");
        }
    }
}
