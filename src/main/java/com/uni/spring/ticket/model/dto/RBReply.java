package com.uni.spring.ticket.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RBReply {

	private String replyNo;//댓글번호
	private String rbNo;//게시글번호
	private String userNo;//회원번호
	private String content;//댓글내용
	private Date date;//작성일
	private String status;//상태값
	
}
