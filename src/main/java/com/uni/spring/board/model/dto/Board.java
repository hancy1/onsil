package com.uni.spring.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // 롬복
public class Board {

	private int bNo;
	private String userNo;
	private String bCategoryNo;
	private String bTitle;
	private String bContent;
	private Date bDate;
	private int bCount;
	private String bOriginName;
	private String bChangeName;
	private String bStatus;
	private String userId;	// 작성자 아이디 출력용
	private String bCategoryName; // 카테고리명 출력용
}
