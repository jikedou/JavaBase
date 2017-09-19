package _10Socket;

import sun.reflect.generics.scope.Scope;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created by admin on 2017/9/19.
 */
public class _1TestServer {
    public static void main(String[] args) {

        ServerSocket ss = null;
        try {
            ss = new ServerSocket(8888);
        } catch (IOException e) {
            e.printStackTrace();
        }
        while (true) {
            try {

                Socket s = ss.accept();
                OutputStream os = s.getOutputStream();
                DataOutputStream dos = new DataOutputStream(os);
                dos.writeUTF("连接成功！IP:" + s.getInetAddress() + ",端口：" + s.getLocalPort() + "来自服务器");
                dos.flush();
                dos.close();
                s.close();

            } catch (IOException e) {
                System.out.println("服务器端出错");
            }
        }
    }
}
