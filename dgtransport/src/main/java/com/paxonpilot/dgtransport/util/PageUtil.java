package com.paxonpilot.dgtransport.util;

import java.util.List;

public class PageUtil {
	public static Page getPage(Integer pageSize,Integer startIndex,Integer totalCount,List datas){
		return new Page(pageSize,startIndex,totalCount,datas);
	}
	
	public static Integer getTotalPage(Integer pageSize,Integer totalCount){
		if(totalCount%pageSize==0){
			return totalCount/pageSize;
		}else{
			return totalCount/pageSize+1;
		}
	}
	
	public static Integer getStartIndex(Integer currentPage,Integer pageSize){
		return (currentPage-1)*pageSize;
	}
	
	public static Integer getCurrentPage(Integer currentPage){
		return currentPage == 0 ? 1 :currentPage;
	}
	
	public static Integer getPageSize(Integer pageSize){
		return pageSize == 0 ? 10 : pageSize;
	}
	
	public static boolean hasNextPage(Integer currentPage,Integer totalPage){
		return currentPage == totalPage || totalPage == 0 ? false :true;
	}
	
	public static boolean hasPreviousPage(Integer currentPage){
		return currentPage>1;
	}
	
	public static Integer getStartPage(Integer currentPage,Integer pageSize){
		return (currentPage-1)*pageSize;
	}
}
