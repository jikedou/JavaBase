package _8IO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class _3TestFileReader {
	public static void main(String[] args) {
		FileReader fileReader = null;

		int f = 0;
		int num = 0;
		String filepath = "D:\\Documents\\Workspaces\\eclipse-workspace\\JavaBase\\src\\_8IO\\_3TestFileReader.java";
		try {
			fileReader = new FileReader(filepath);

			while ((f = fileReader.read()) != -1) {
				System.out.print((char) f);
				num++;
			}
			System.out.println("共" + num + "个字符");
			fileReader.close();
		} catch (FileNotFoundException e) {
			System.out.println("找不到文件");
		} catch (IOException e) {
			System.out.println("文件读写错误");
		}
	}
}
