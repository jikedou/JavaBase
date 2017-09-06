package _8IO;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class _6TestBufferStream1 {

	public static void main(String[] args) {
		BufferedReader br=null;
		String filepath="d:/javatestpath/1.txt";
		String b =null;
		int a=0;
		FileReader fReader=null;
		//第一种方式
		try {
			br=new BufferedReader(new FileReader(filepath));
			while((b=br.readLine())!=null) {
				System.out.println(b);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//第二种方式
		try {
			fReader=new FileReader(filepath);
			while((a=fReader.read())!=-1) {
				System.out.print((char)a);
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
