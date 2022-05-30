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
public class Inquiry {

	private String inquiryNo; // 글번호
	private String category; // 카테고리
	private String count; // 조회수
	private String title; // 제목
	private String writer; // 작성자
	private String userId; // 작성자 아이디 
	private String userNo; // 작성자 번호
	private Date createDate; // 게시날짜
	private String content; // 내용
	private String open; // 공개여부
	private String status; // 상태
	private String replyCount; // 댓글 갯수
}
