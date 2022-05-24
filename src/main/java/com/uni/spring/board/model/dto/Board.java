package com.uni.spring.board.model.dto;

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
public class Board {

	private int bNo;
	private String userNo;	
	private String bCategoryNo;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bCount;
	private String originName;
	private String changeName;
	private String bStatus;
}
