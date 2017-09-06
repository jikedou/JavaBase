package _8IO;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class _8TestBufferReader_Writer {
	public static void main(String[] args) {
		String filepath = "d:/javatestfiles/bufferreader.txt";
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(filepath));
			BufferedReader br = new BufferedReader(new FileReader(filepath));
			for (int i = 0; i < 100; i++) {
				bw.write(i+"");
			}
			bw.flush();
			int  b =0;
			while ((b = br.read()) != -1) {
				System.out.println(b);
			}
			bw.close();
			br.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
