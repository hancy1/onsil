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
public class ProReview {

	/*
	REVIEW_NO
	REVIEW_WRITER
	PRO_CODE
	REVIEW_STAR
	REVIEW_TITLE
	REVIEW_CONTENT
	ORIGIN_NAME
	CHANGE_NAME
	REVIEW_DATE
	REVIEW_COUNT
	REVIEW_STATUS
	*/
	
	private int reviewNo; //리뷰번호
	private int reviewWriter; //작성자(유저번호)
	private String proCode; //제품코드
	private int reviewStar; //별점	
	private String reviewTitle;//제목
	private String reviewContent;//내용
	private String originName;//첨부파일 원본명
	private String changeName;//첨부파일 수정명
	private Date reviewDate;//등록날짜
	private int reviewCount; //조회수
	private String reviewStatus; //리뷰상태
	
	
}
