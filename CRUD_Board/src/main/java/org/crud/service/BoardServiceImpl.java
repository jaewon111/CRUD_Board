package org.crud.service;

import java.util.List;

import org.crud.domain.BoardVO;
import org.crud.domain.Paging;
import org.crud.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;

	
	@Override
	public BoardVO read(Long bno) {
		// TODO Auto-generated method stub
		return mapper.read(bno);
	}


	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("게시글 등록 :" + board);
		mapper.insert(board);
	}

	@Override
	public boolean delete(Long bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}


	@Override
	public boolean update(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.update(board);
	}


	@Override
	public List<BoardVO> getList(Paging paging) {
		// TODO Auto-generated method stub
		
		return mapper.getListWithPaging(paging);
	}


	@Override
	public int TotalCount(Paging paging) {
		// TODO Auto-generated method stub
		return mapper.TotalCount(paging);
	}


	@Override
	public Long addRef(Long bno) {
		// TODO Auto-generated method stub
		return mapper.addRef(bno);
	}

    



	

}
