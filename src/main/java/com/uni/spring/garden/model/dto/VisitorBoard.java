package com.uni.spring.garden.model.dto;

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
public class VisitorBoard { //방명록dto

	private String boardNo; //글번호
	private String writer; //작성자회원번호
	private String hostUser; //방명록 주인 회원번호
	private String content; //내용
 	private Date enrollDate; //등록일
	private String status; //상태
	
	
}
