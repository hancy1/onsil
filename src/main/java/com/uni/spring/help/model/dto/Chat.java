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
public class Chat {

	private String chatRoomNo; // 채팅방번호
	private String chatNo; // 채팅번호
	private String writer; // 작성자
	private String content; // 내용
	private Date sendDate; // 보낸날자
	private String status; // 상태
}
