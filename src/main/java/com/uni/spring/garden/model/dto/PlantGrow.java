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
public class PlantGrow {
	private String listNo;
	private String plantNo;
	private String userNo;
	private String plantName;
	private String nickname;
	private String water;
	private String supplement;
	private String repotting;
	private String etc;
	private String enrollDate;
	private String status;
}
