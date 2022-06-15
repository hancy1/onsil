package com.uni.spring.shop.model.dto;

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
public class ReviewLike {

	
	/*
	LIKE_NO
	REVIEW_NO
	USER_NO
	LIKE_STATUS
	 */
	
	
	private int likeNo; 	//도움됐어요 번호
	private int reviewNo; 	//리뷰번호
	private int userNo; 	//유저번호
	private int likeStatus; //도움됐어요 여부(1이 된상태,0이 안된상태)
	
}
