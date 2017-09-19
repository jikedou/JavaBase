package _10Socket;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Created by admin on 2017/9/19.
 */
public class TCPClient {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("127.0.0.1", 6666);
            OutputStream os = s.getOutputStream();
            DataOutputStream dos = new DataOutputStream(os);
            dos.writeUTF("哈哈，连接到服务器了");
            dos.flush();
            dos.close();
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
