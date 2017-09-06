package _8IO;

import java.io.FileInputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class _1TestFileInputStream {
	public static void main(String[] args) {
		int b=0;
		int num=0;
		FileInputStream fis=null;
		String filepath="D:\\Documents\\Workspaces\\eclipse-workspace\\JavaBase\\src\\_8IO\\TestFileInputStream.java";
		try {
			fis=new FileInputStream(filepath);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			//此时fis.read(),读取一个字节并以整数的形式返回（0-255）,例如p的整数形式就是112，如果返回为-1说明已读到输入流的末尾
			while((b=fis.read())!=-1) {
				System.out.print((char)b);//此时是将整数形式的字节（112）转化为字节（p）
				num++;
			}
			fis.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("共有"+num+"个字节");
		System.out.println((char)112);
	}
}
