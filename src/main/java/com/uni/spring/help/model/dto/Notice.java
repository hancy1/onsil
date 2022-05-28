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
public class Notice {

	private String noticeNo; // 글번호
	private String category; // 카테고리
	private String title; // 제목
	private String writer; // 작성자
	private String userId; // 작성자 아이디 - 버튼 클릭을 위한
	private Date createDate; // 게시날짜
	private String content; // 내용
	private String status; // 상태
}
