package _10Socket;


import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class _2TestServer {
    public static void main(String[] args) {
        try {
            ServerSocket ss=new ServerSocket(5888);
            Socket s = ss.accept();
            OutputStream os = s.getOutputStream();
            DataOutputStream dos = new DataOutputStream(os);
            InputStream is = s.getInputStream();
            DataInputStream dis = new DataInputStream(is);
            String b=null;
            dos.writeUTF("hello");

            while ((b = dis.readUTF()) != null) {
                System.out.println(b);
            }
            dis.close();
            dos.close();
            s.close();
            ss.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
