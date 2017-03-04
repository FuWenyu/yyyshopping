package com.easyshopping;

import java.io.Serializable;

public class DatagridDTO implements Serializable{

	private static final long serialVersionUID = -4173722753051382652L;
	
	private Long total;
	
	private Object rows;
	
	private int pageSize = 10;
	
	private int pageNo = 1;

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

}
