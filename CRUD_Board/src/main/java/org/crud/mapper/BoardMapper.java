package org.crud.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.crud.domain.BoardVO;
import org.crud.domain.Paging;

public interface BoardMapper {
	
	public List<BoardVO> getList(); //글 목록 가져오기
	
	public BoardVO read(Long bno); // n번 게시글 조회
	
	public void insert(BoardVO board); //글 쓰기 
	
	public boolean delete(Long bno); //글 삭제
	
	public boolean update(BoardVO board); //글 수정 
	
	public List<BoardVO> getListWithPaging(Paging paging); //페이징 
	
	public int TotalCount(Paging paging); //게시글 총합
	
	public Long addRef(Long bno); //조회수 증가 
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount")int amount);
	
	 

}
