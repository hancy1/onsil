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
public class Neighbor {


	private String neighborNo; //이웃번호
	private String userNo; //로그인한 회원 번호
	private String nUserNo; //이웃 회원 번호
	private Date enrollDate;
	private String status;
	
}
