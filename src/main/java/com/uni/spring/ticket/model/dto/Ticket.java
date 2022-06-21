package com.uni.spring.ticket.model.dto;

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
public class Ticket {//티켓등록

	
	private String ticketNo;//티켓번호
	private String userNo;//작성자
	private String price;//가격코드
	private String userName;//회원 이름
	
	private String ticketPhone;//업체전화번호
	private String ticketTitle;//전시회명
	private String ticketNotice;//공지사항
	private String ticketLocation;//위치
	private Date ticketDate;//날짜
	private String status;//상태값
	private String originName;//첨부파일원본이름
	private String changeName;//첨부파일 수정이름
	private String userId;//작성자 아이디
	private String division;//티켓구분
	
}
