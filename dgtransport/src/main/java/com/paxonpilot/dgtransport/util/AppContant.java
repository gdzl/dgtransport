package com.paxonpilot.dgtransport.util;

import java.util.HashMap;
import java.util.Map;

public class AppContant {
	public static String USER_CONTEXT = "userContext";
	public static String LOGIN_PATH = "loginPath";
	public static String USER_AUTHORITYLIST="authorityList";
	
	public static Map<String,Long> STREETNO=new HashMap<String,Long>();
	public static Map<Integer,String> PROPERTY=new HashMap<Integer,String>();
	
	static{
		STREETNO.put("大良", 1L);
		STREETNO.put("勒流", 2L);
		STREETNO.put("伦教", 3L);
		STREETNO.put("容桂", 4L);
		STREETNO.put("陈村", 5L);
		STREETNO.put("均安", 6L);
		STREETNO.put("杏坛", 7L);
		STREETNO.put("龙江", 8L);
		STREETNO.put("乐从", 9L);
		STREETNO.put("北滘", 10L);
		PROPERTY.put(1,"驾驶员");
		PROPERTY.put(2,"管理员");
		PROPERTY.put(3,"押运员");
    }
}
