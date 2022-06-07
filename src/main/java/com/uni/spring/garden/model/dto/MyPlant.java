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
public class MyPlant {
	private String plantNo;
	private String userNo;
	private String plantName;
	private String nickname;
	private String water;
	private String sun;
	private String fileName;
	private String serverName;
	private Date enrollDate;
	private String status;
}
