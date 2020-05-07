package org.crud.service;

import java.util.List;

import org.crud.domain.Paging;
import org.crud.domain.PagingDTO;
import org.crud.domain.ReplyPagingDTO;
import org.crud.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO replyvo); //등록 
	
	public ReplyVO read(Long rno); //조회 
	
	public int update(ReplyVO replyvo);//수정
	
	public int delete(Long rno);//삭제
	
	public List<ReplyVO> getList(Paging paging, Long bno); 
	
	public ReplyPagingDTO getListPage(Paging paging, Long bno);


	

}
