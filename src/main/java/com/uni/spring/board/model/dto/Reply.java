package com.uni.spring.board.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // 게터,세터 생성자
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Reply {

	private int replyNo;
	private String userNo;
	private int bNo;
	private String reContent;
	private Timestamp reDate;
	private String reStatus;
	
}
