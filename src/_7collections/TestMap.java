package _7collections;

import java.util.HashMap;
import java.util.Map;

public class TestMap {
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<>();
		map.put("name", "zhangsan");
		map.put("age", "1");
		map.put("gender", "nan");
		System.out.println("原map：" + map);

		Object object = map.put("name", "lisi");// 此处object为让lisi替换掉的值
		System.out.println("改map:" + map);
		System.out.println(object);
		
		System.out.println(map.get("age"));//通过key获取value
		System.out.println(map.containsKey("time"));//查看map中是否有key值为time的
		System.out.println(map.containsValue("1"));//查看map中是否有valur值为1的
		System.out.println("map的长度："+map.size());//map的长度
		Map<String,String> map2=new HashMap<>();
		map2.put("one", "111");
		map2.put("two", "222");
		map.putAll(map2);
		System.out.println(map);
	}
}
