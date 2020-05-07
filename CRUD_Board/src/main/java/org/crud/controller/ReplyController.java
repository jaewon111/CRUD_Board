package org.crud.controller;

import org.springframework.http.MediaType;

import java.util.List;

import org.crud.domain.Paging;
import org.crud.domain.ReplyPagingDTO;
import org.crud.domain.ReplyVO;
import org.crud.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



//REST방식
@RequestMapping("/reply/")
@AllArgsConstructor
@RestController
@Log4j
public class ReplyController {
	
	private ReplyService service; 
	
	//등록 POST방식  URL -> /reply/new
	@PostMapping(value = "/new", 
			consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO replyvo){
		
		int insertCount = service.register(replyvo);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	//조회 GET방식 URL -> /reply/{rno} 
	@GetMapping(value = "/{rno}", 
			    produces= {MediaType.APPLICATION_XML_VALUE, 
			    		   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno")Long rno){
		
	     log.info("get :" + rno);
		 
	     return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
	}
	
	//수정 put또는Patch 방식 URL -> /reply/update 
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			        value="/{rno}",
	                consumes = "application/json", 
	                produces= {MediaType.TEXT_PLAIN_VALUE})
     public ResponseEntity<String> update(@RequestBody ReplyVO replyvo, @PathVariable("rno") Long rno){
		
		  replyvo.setRno(rno);

          return service.update(replyvo) == 1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
    }
    
	 //삭제Post방식 URL ->/reply/delete
	@DeleteMapping(value = "/{rno}", 
			       produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		return service.delete(rno) == 1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	//댓글 리스트
	/*
	 * @GetMapping(value = "/pages/{bno}/{page}", produces =
	 * {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	 * public ResponseEntity<List<ReplyVO>> getList( @PathVariable("bno") Long
	 * bno, @PathVariable("page") int page){
	 * 
	 * log.info("글번호:" + bno + "" + "페이지:" + page); Paging paging = new Paging(page,
	 * 10); //한페이지에 10개의 댓글만 log.info(paging); return new
	 * ResponseEntity<>(service.getList(paging, bno), HttpStatus.OK); }
	 */
	
	//댓글 페이징 
	@GetMapping(value = "/pages/{bno}/{page}",
			    produces = {MediaType.APPLICATION_XML_VALUE,
			    		    MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPagingDTO> getList(@PathVariable("page")int page, @PathVariable("bno")Long bno){
	
		Paging paging = new Paging(page, 10); // 총합 10개 
		
		log.info("get Reply List bno : " + bno);
		log.info("paging:" + paging);
		
		return new ResponseEntity<>(service.getListPage(paging, bno),HttpStatus.OK);
	}
	
			    		
			    		
			    

}
