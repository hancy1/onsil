package com.uni.spring.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // 게터,세터 생성자
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {

	private int bNo;
	private int userNo;	
	private int bCategoryNo;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bCount;
	private String bOriginName;
	private String bChangeName;
	private String bStatus;
}
