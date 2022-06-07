package com.uni.spring.shop.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

public interface ShopService {

	ArrayList<Point> selectMyPoint(String userNo);

	PointInfo selectPointTotal(String userNo);

	int myReviewListCount(int userNo);

	ArrayList<ProReview> selectMyReviewList(ShopPageInfo pi, int userNo);

	ProReview selectReview(int reviewNo);

	void updateReview(ProReview r);

	void deleteReview(int reviewNo);

	int productListCount();

	ArrayList<Product> selectShopList(ShopPageInfo pi);

	ArrayList<Cart> selectCartList(int userNo);

	ArrayList<ProOrder> selectOrderList(int userNo);

	void deleteCart(int cartNo);

	void insertCart(Map cartMap);



	

}
