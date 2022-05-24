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
public class Point {

	
	/*
	 POINT_NUM
	USER_NO
	POINT_VAL
	POINT_DATE
	POINT_TYPE*/
	
	private int pointNum; //포인트번호
	private int userNo; //유저번호
	private int pointVal; //포인트
	private Date pointDate;//등록날짜
	private String pointType; //타입(적립/사용)


	
	
}
