package _8IO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
/**
 * 流的读取与写入
 * 其实就是复制文本
 * @author admin
 *
 */
public class _2TestFileOutputStream {
	public static void main(String[] args) {
		String filepath1 = "D:\\Documents\\Workspaces\\eclipse-workspace\\JavaBase\\src\\_8IO\\TestOutputStream.java";
		String filepath2 = "D:\\Documents\\Workspaces\\eclipse-workspace\\JavaBase\\src\\_8IO\\TestOutputStreamCopy.java";
		int b=0;
		try {
			FileInputStream fileInputStream = new FileInputStream(filepath1);
			FileOutputStream fileOutputStream = new FileOutputStream(filepath2);
			while((b=fileInputStream.read())!=-1) {
				fileOutputStream.write(b);
			}
			fileOutputStream.flush();
			fileInputStream.close();
			fileOutputStream.close();
			System.out.println("复制成功");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
