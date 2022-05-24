package com.uni.spring.bQuestion.model.dto;

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
public class bQuestion {

	private int bqNo;
	private String userNo;	
	private String bqTitle;
	private String bqContent;
	private Date bqDate;
	private int bqCount;
	private String bqOriginName;
	private String bqChangeName;
	private String bqStatus;
}
