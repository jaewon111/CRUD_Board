package org.crud.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno; //댓글번호
	private Long bno; //게시글 번호
	private String reply; //댓글
	private String replyer; //댓글 단 사람 
	private Date replyDate; //댓글 단 날짜 
	private String password; //댓글 단 사람 패스워드
}
