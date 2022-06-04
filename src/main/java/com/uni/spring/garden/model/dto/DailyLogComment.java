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
	private String commentGroup; // 댓글번호를 기준으로 답글과 연결하는 번호
	private String groupSeq; // 그룹별 순서
	private String commentType; // 댓글유형. 0: 일반 댓글, 1: 답글
	private String userNo; //회원번호
	private String content; //내용
 	private Date enrollDate; //등록일
	private String status; //상태	
}
