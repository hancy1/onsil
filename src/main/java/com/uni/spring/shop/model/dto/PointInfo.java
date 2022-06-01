package com.uni.spring.shop.model.dto;

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
public class PointInfo {
//total포인트 정보
//회원가입시(Member테이블 insert시 본 테이블에도 자동으로 회원번호 추가됨
	
	/*
	USER_NO
	TOTAL_POINT
	*/
	
	private int userNo;//회원번호
	private String totalPoint;//누적포인트
	
}
