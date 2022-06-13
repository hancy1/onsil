package com.uni.spring.board.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data 
public class Reply {

	private int replyNo;
	private String userNo;
	private int bNo;
	private String reContent;
	private Timestamp reDate;
	private String reStatus;
	private String userId; //아이디 출력용
	
}
