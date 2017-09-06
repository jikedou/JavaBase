package _8IO;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class _5TestFileReader_Writer {
	public static void main(String[] args) {
		String filepath1 = "d:/javatestpath/a.txt";
		String filepath2 = "d:/javatestpath/b.txt";
		File file = null;
		FileReader fReader = null;
		FileWriter fWriter = null;
		int f = 0;
		try {
			fReader = new FileReader(filepath1);
			file = new File(filepath2);
			fWriter = new FileWriter(filepath2);
			while ((f = fReader.read()) != -1) {
				fWriter.write(f);

			}
			System.out.println("复制成功！");
			fReader.close();
			fWriter.flush();
			fWriter.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;

	}
}
