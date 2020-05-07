package org.crud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crud.domain.Paging;
import org.crud.domain.ReplyVO;

public interface ReplyMapper {
	
	
	  public int insert(ReplyVO replyvo); //댓글 등록
	  
	  public ReplyVO read(Long bno); //댓글 조회
	  
	  public int delete(Long bno); //댓글 삭제
	  
	  public int update(ReplyVO replyvo); //댓글 수정

	  public List<ReplyVO> getListWithPaging(@Param("paging")Paging paging, @Param("bno") Long bno);//댓글 리스트
	  
	  public int CountBno(Long bno); //댓글 개수  
    
}
