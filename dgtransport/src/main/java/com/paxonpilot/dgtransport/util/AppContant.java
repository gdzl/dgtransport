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
		STREETNO.put("����", 1L);
		STREETNO.put("����", 2L);
		STREETNO.put("�׽�", 3L);
		STREETNO.put("�ݹ�", 4L);
		STREETNO.put("�´�", 5L);
		STREETNO.put("����", 6L);
		STREETNO.put("��̳", 7L);
		STREETNO.put("����", 8L);
		STREETNO.put("�ִ�", 9L);
		STREETNO.put("����", 10L);
		PROPERTY.put(1,"��ʻԱ");
		PROPERTY.put(2,"����Ա");
		PROPERTY.put(3,"Ѻ��Ա");
    }
}
