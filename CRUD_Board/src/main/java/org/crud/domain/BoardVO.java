package org.crud.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno; //글번호
	private String title; //제목
	private String content; //내용
	private String writer; //글쓴이 
	private Date regdate; //올린날짜
	private Long ref;  //조회수
	private String password; //패스워드
	
	private int replyCnt;//게시글 댓글 수 
	
}
