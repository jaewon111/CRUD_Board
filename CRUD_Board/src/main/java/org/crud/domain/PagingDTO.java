package org.crud.domain;


import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PagingDTO {

	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	private boolean prev, next; //이전, 다음
	
	private int total; // 총합 
	private Paging paging; //페이징 
	
	//생성자
	public PagingDTO(Paging paging, int total) {
		  
		this.paging= paging;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(paging.getPageNum() / 10.0)) * 10; //페이징 끝번호 계산
		
		this.startPage = this.endPage - 9; //페이징 시작번호 
		
		int realEnd=(int) (Math.ceil((total*1.0) / paging.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage= realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage  < realEnd;
	   
	}



	
	
}
