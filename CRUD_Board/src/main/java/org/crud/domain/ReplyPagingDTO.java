package org.crud.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPagingDTO {

	private int replyCnt;
	private List<ReplyVO> list;
	
}
