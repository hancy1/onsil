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

	
	private String TicketNo;//티켓번호
	private String writer;//작성자
	private String price;//가격코드
	private String phone;//업체전화번호
	private String ticketTitle;//전시회명
	private String notice;//공지사항
	private String location;//위치
	private Date createDate;//날짜
	private String Status;//상태값
	private String OriginName;//첨부파일원본이름
	private String ChangeName;//첨부파일 수저이름
	
}
