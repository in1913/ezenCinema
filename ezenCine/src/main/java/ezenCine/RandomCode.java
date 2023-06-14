package ezenCine;

import org.apache.commons.lang3.RandomStringUtils;

public class RandomCode {

	public static String getRandomCode(int size) {
		String result = RandomStringUtils.randomNumeric(size);
		return result;
	}
}
