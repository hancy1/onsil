package com.uni.spring.help.model.dto;

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
public class Answer {
	
	private String answerNo; // 답변번호
	private String reperNo; // 참조문의글번호
	private String writer; // 작성자
	private Date createDate; // 답변날짜
	private String answer; // 답변
	private String status; // 상태

}
