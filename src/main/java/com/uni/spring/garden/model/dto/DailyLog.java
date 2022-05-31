package com.uni.spring.garden.model.dto;

import java.sql.Timestamp;

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
public class DailyLog {

	private String logNo;
	private String userNo;
	private String fileName;
	private String serverName;
	private String content;
	private Timestamp enrollDate;
	private String status;
	
}
