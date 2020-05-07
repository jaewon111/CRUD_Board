package org.crud.controller;


import org.crud.domain.BoardVO;
import org.crud.domain.Paging;
import org.crud.domain.PagingDTO;
import org.crud.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	//게시글 목록 및 페이징 처리 
	@GetMapping("/list")
	public void list(Paging paging, Model model) {
		
		log.info("리스트: " + paging);
		model.addAttribute("list", service.getList(paging));
		
        int total = service.TotalCount(paging); //게시글 총합
		model.addAttribute("pageMaker", new PagingDTO(paging, total)); 
	}
	
	
	
	
	//게시글 조회
    @GetMapping({"/read","/update"})
    public void read(@RequestParam("bno") Long bno, Model model, @ModelAttribute("paging")Paging paging) {
    	//@ModelAttribute -> 자동으로 model에 데이터를 지정한 이름으로 담는다.
    	
    service.addRef(bno); //조회수 증가
    model.addAttribute("board", service.read(bno));

    }
    
    
    //글쓰기 화면으로 이동  
    @GetMapping("/register")
    public void register() {}

 
    //글쓰기 화면 처리  
    @PostMapping("/register")
    public String register(BoardVO board, RedirectAttributes rttr) {
    	
    	service.register(board);
    	
    	rttr.addFlashAttribute("result", board.getBno()); //일회성을 위해 addFlashAttribute를 이용
    	
    	return "redirect:/board/list"; //게시글 등록하고 list목록으로 이동
    }
    
    //게시글 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam("bno")Long bno, RedirectAttributes rttr) {
    		//,@RequestParam("password")String password
    	
    	service.delete(bno);
    	if(service.delete(bno)) {
    		rttr.addFlashAttribute("result", "success");
    	}
   	    
    	
    	log.info("(BoardController)delete 실행");	
    	return "redirect:/board/list";
    }
    
    
    //게시글 수정
    @PostMapping("/update")
    public String update(BoardVO board, RedirectAttributes rttr) {
    	
    	if(service.update(board)) {
    		rttr.addFlashAttribute("result","success");
    	}
    	return "redirect:/board/list";
    }
    
    //TEST
    @RequestMapping("/test")
    public String test() {
    	return "/board/test";
    }
     

	 

}
