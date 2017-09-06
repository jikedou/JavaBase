package _7collections;

import java.util.HashMap;
import java.util.Map;
/**
 * 自动打包 解包
 * 1.5之后有
 * @author admin
 *
 */
public class TestMap1 {
	public static void main(String[] args) {
		Map map = new HashMap<>();
		map.put("name", "zhangsan");
		map.put("age", 11);
		map.put("gender", 2);
		System.out.println(map);
		System.out.println(map.get("age"));
	}
}
