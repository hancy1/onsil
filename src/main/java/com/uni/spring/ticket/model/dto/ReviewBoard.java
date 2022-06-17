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
public class ReviewBoard {
	
	private String rbNo;//게시글번호
	private String userNo;//회원번호
	private String category;//카테고리 번호
	private String Rbtitle;//게시글제목
	private String RbContent;//게시글 내용
	private String rcount;//조회수
	private Date date;//작성일
	private String originName;//파일원본
	private String chageName;//수정파일명
	private String status;//상태값

}
