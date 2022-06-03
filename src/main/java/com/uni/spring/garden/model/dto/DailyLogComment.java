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
public class DailyLogComment {

	private String commentNo; //댓글번호
	private String logNo; // 글번호
	private String userNo; //회원번호
	private String content; //내용
 	private Date enrollDate; //등록일
	private String status; //상태	
}
