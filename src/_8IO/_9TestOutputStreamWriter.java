package _8IO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class _9TestOutputStreamWriter {
	public static void main(String[] args) {
		try {
			OutputStreamWriter osWriter = new OutputStreamWriter(new FileOutputStream("d:/javatest/1.txt"));
			osWriter.write("hahahahahahaha");
			//没有指定编码格式的情况下，使用系统默认的编码格式
			System.out.println(osWriter.getEncoding());//拿到osWriter的字符编码
			osWriter.flush();
			osWriter.close();
			//路径后边的参数默认是false，即先擦去原文件的内容，在添加新的，当设置为true时，是在原文件后边添加
			osWriter=new OutputStreamWriter(new FileOutputStream("d:/javatest/1.txt",true));
			osWriter.write("Hello");
			osWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
