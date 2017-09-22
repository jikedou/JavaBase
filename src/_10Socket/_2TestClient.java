package _10Socket;

import java.io.*;
import java.net.Socket;

public class _2TestClient {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("127.0.0.1", 5888);
            OutputStream os = s.getOutputStream();
            DataOutputStream dos = new DataOutputStream(os);
            InputStream is = s.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            String b = null;
            dos.writeUTF("nihao");

            while ((b = dis.readUTF()) != null) {
                System.out.println(b);
            }
            dis.close();
            dos.close();
            s.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
