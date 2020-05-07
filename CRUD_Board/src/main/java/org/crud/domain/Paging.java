package org.crud.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Paging {
	
	private int pageNum; //페이지 번호
	private int amount; //한 페이지 당 나타낼수 있는 게시글 수
    
	private String type;
	private String keyword;
	
	public Paging() {
		this(1,10);
	}
	
	public Paging(int pageNum, int amount) {
		// TODO Auto-generated constructor stub
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	} // 검색조건 
	
	
	
	

}
