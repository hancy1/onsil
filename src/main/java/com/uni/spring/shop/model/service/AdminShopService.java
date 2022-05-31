package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

public interface AdminShopService {

	
	//판매상품
	int selectListCount();
	
	ArrayList<Product> selectList(ShopPageInfo pi);
	
	void insertProduct(Product p);
	
	Product selectProduct(String proCode);
	
	void deleteProduct(String proCode);
	
	void updateProduct(Product p);

	
	//사은품
	int freebieListCount();
	
	ArrayList<Freebie> selectFreebieList(ShopPageInfo pi);
	
	void insertFreebie(Freebie f);
	
	Freebie selectFreebie(int freeNo);
	
	void deleteFreebie(int freeNo);
	
	void updateFreebie(Freebie f);

	
	//리뷰
	int reviewListCount();

	ArrayList<ProReview> selectReviewList(ShopPageInfo pi);

	void deleteAdminReview(int reviewNo);

	

}
