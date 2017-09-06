package _8IO;

import java.io.FileWriter;
import java.io.IOException;

public class _4TestFileWriter {
	public static void main(String[] args) {
		String filepath="d:/javatestpath/1.txt";
		FileWriter fileWriter=null;
		try {
			fileWriter=new FileWriter(filepath);//只能帮着建文件，不能帮着建目录
			for(int i=0;i<50000;i++) {
				fileWriter.write(i+"\t");
			}
			fileWriter.flush();
			fileWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
