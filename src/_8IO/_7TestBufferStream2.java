package _8IO;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;

public class _7TestBufferStream2 {

	public static void main(String[] args) {
		BufferedInputStream bis = null;
		String filepath = "D:/www/feedback/conn.php";
		String b = null;
		int a = 0;
		try {
			bis=new BufferedInputStream(new FileInputStream(filepath));
			bis.mark(2);
			System.out.println((char)bis.read());
			System.out.println((char)bis.read());
			System.out.println((char)bis.read());
			System.out.println((char)bis.read());
			System.out.println((char)bis.read());
			System.out.println((char)bis.read());
			System.out.println("++++++");
			System.out.println("++++++");
			bis.reset();
			
			for (int i = 0; i < 4&&((a=bis.read())!=-1); i++) {
				System.out.println((char)a);
			}
			bis.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
