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
public class Freebie {
	
	/*
	FREE_NO
	FREE_NAME
	ORIGIN_NAME
	CHANGE_NAME
	FREE_POINT
	FREE_AMOUNT
    */

	private int freeNo; //사은품번호
	private String freeName; //사은품이름
	private String originName; //사은품원본사진명
	private String changeName; //사은품수정사진명	
	private int freePoint; //소모포인트
	private int freeAmount; //수량

	
}
