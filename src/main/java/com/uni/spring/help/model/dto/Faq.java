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
public class Faq {

	private String faqNo; // 글번호
	private String category; // 카테고리
	private String categoryName; // 카테고리 이름
	private String question; // 질문
	private String answer; // 답변
	private Date createDate; // 게시날짜
	private String status; // 상태
}
