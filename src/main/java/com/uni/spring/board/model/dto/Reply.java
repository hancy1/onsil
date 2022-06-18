package com.uni.spring.board.model.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data 
public class Reply {

	private int reNo;
	private String userNo;
	private int bNo;
	private String reContent;
	private Timestamp reDate;
	private String reStatus;
	
	private String userName;	// 작성자 이름 출력용
	
}
