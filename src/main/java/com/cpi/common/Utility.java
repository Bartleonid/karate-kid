package com.project.common;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utility {

	public static String extractValueByRegex(String html, String pattern) {
		String value = null;
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(html);
		if (m.find()) {
			value = m.group(1);
			return value;
		}
		return null;
	}
}
