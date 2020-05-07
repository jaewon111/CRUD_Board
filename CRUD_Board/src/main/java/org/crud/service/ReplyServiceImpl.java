package org.crud.service;

import java.util.List;

import org.crud.domain.Paging;
import org.crud.domain.PagingDTO;
import org.crud.domain.ReplyPagingDTO;
import org.crud.domain.ReplyVO;
import org.crud.mapper.BoardMapper;
import org.crud.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;

	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardmapper;
	
	
	
	
	@Override
	public int register(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		boardmapper.updateReplyCnt(replyvo.getBno(), 1);  
		return mapper.insert(replyvo);
	}

	@Override
	public ReplyVO read(Long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int update(ReplyVO replyvo) {
		// TODO Auto-generated method stub
		return mapper.update(replyvo);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		ReplyVO replyvo = mapper.read(rno);
		
		boardmapper.updateReplyCnt(replyvo.getBno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Paging paging, Long bno) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(paging, bno);
	}

	@Override
	public ReplyPagingDTO getListPage(Paging paging, Long bno) {
		// TODO Auto-generated method stub
		return new ReplyPagingDTO(mapper.CountBno(bno), mapper.getListWithPaging(paging, bno));
	}

	
	  

}
