package org.crud.service;

import java.util.List;

import org.crud.domain.BoardVO;
import org.crud.domain.Paging;

public interface BoardService {
	
	public BoardVO read(Long bno);
	
	public void register(BoardVO board); // 게시글 등록
	
	public boolean delete(Long bno);
	
	public boolean update(BoardVO board);
	
    public List<BoardVO> getList(Paging paging); //게시글 목록 과 페이징 
    
    public int TotalCount(Paging paging); //게시글 총합
    
    public Long addRef(Long bno); //조회수 증가
    

}
