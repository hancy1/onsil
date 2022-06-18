package com.uni.spring.shop.model.dto;


import java.sql.Timestamp;
import java.util.Date;

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

public class ProOrder {

	
	/*
	ORDER_NO
	CART_NO
	PRO_CODE
	FREE_NO
	USER_NO
	PAY_CODE
	AMOUNT
	ORDER_NAME
	ORDER_PHONE
	ADDRESS
	ADDRESS_DETAIL
	ORDER_STATUS
	ORDER_DATE
	ORDER_R_INSERT
	
	PRO_NAME
	PRICE
	FREE_NAME
	USER_ID
	*/
	
	
	private int orderNo;			 //오더번호
	private int cartNo; 			 //카트번호
	private String proCode;			 //제품코드
	private int freeNo; 			 //사은품번호
	private int userNo; 			 //유저번호
	private String payCode;			 //결제코드
	private int amount; 			 //수량
	private String orderName;		 //수령인
	private String orderPhone;		 //연락처
	private String address;			 //배송주소
	private String addressDetail;	 //배송상세주소
	private String orderStatus;		 //오더상태 디폴트 Y	
	//private Date orderDate;	
	private Timestamp orderDate;	//주문날짜
	private String orderRInsert; 	//리뷰등록 여부 디폴트 N

	private String proName; 		//제품명
	private int price;				//가격(개당가격)
	private String freeName; 		//사은품이름
	private String userId; 			//회원아이디
	
	
	private String startDate;	//검색시작일(주문날짜기준)
	private String endDate;		//검색종료일(주문날짜기준)

	
}
