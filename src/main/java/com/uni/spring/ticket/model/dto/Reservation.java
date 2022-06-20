package com.uni.spring.ticket.model.dto;

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
public class Reservation {

	private String rNo;//예약번호
	private String ticketNo;//티켓번호
	private String ticketTitle;
	private String userNo;//회원번호
	private String payCode;//결제코드
	private String tCode;//티켓코드
	private String count;//인원수
	private String status;//상태값
	private String changeName;
}
