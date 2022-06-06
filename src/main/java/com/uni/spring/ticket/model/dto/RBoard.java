package com.uni.spring.ticket.model.dto;

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
public class RBoard {

	private String rbNo;//게시글번호
	private String userNo;//회원번호
	private String userId;//회원아이디
	private String TCategoryNo;//카테고리번호
	private String rbTitle;//게시글제목
	private String rbContent;//게시글 내용
	private int count;//조회수
	private Date date;//작성일
	private String originName;//첨부파일원본명
	private String changeName;//첨부파일수정명
	private String status;//상태값
	private String like;
	
	
}
