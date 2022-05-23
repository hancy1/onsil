package com.uni.spring.member.model.dto;

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
public class Member {
	
	private String userNo; // 회원번호
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private String userName; // 이름
	private Date birth;	// 생년월일
	private String gender;	// 성별	
	private String address; // 주소
	private String addressDetail; // 상세주소
	private String tel; // 일반전화
	private String phone; // 휴대전화
	private String email; // 이메일
	private String preference; // 선호도
	private Date enrollDate; // 가입일
	private Date delDate; // 탈퇴일 
	private String status; // 회원상태
	
}
