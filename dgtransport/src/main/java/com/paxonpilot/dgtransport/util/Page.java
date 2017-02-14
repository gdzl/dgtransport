package com.paxonpilot.dgtransport.util;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable{
	
	private static Integer DEFAULTSIZE=10;
	private Integer currentPage;//当前页
	private Integer totalPage;//总页数
	private Integer pageSize=DEFAULTSIZE;//每页显示多少条
	private Integer totalCount;//总记录数
	private Integer startIndex;//开始点
	private Boolean hasPrevious;//是否有前一页
	private Boolean hasNext;//是否有下一页
	private List datas;
	
	public Page(Integer pageSize,Integer startIndex,Integer totalCount,List datas){
		this.pageSize = pageSize;
		this.startIndex = startIndex;
		this.totalCount = totalCount;
		this.datas = datas;
	}
	
	public Page(){
		
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Boolean getHasPrevious() {
		return hasPrevious;
	}

	public void setHasPrevious(Boolean hasPrevious) {
		this.hasPrevious = hasPrevious;
	}

	public Boolean getHasNext() {
		return hasNext;
	}

	public void setHasNext(Boolean hasNext) {
		this.hasNext = hasNext;
	}

	public List getDatas() {
		return datas;
	}

	public void setDatas(List datas) {
		this.datas = datas;
	}
	
}
