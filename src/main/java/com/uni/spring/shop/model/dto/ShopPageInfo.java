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
public class ShopPageInfo {
	private int currentPage;
	private int listCount;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int pageLimit;
	private int boardLimit;
	
}
