package _7collections;

import java.util.HashMap;
import java.util.Map;

public class TestMap2 {
	public static Integer INTEGER = new Integer(1);

	public static void main(String[] args) {
		String[] arg = { "aa", "aa", "bb", "cc", "cc", "cc" };
		Map map = new HashMap<>();
		for (int i = 0; i < arg.length; i++) {
			Integer integer = (Integer) map.get(arg[i]);
			map.put(arg[i], (integer == null ? INTEGER : new Integer(integer.intValue() + 1)));
		}
		System.out.println(map);

	}
}
