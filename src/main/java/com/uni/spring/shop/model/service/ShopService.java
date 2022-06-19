package com.uni.spring.shop.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ReviewLike;
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

	ArrayList<ProOrder> selectOrderCancelList(int userNo);

	void cancelRequestOrder(int orderNo);

	void OkOrder(int orderNo);

	String selectProductCode(int orderNo);

	void insertReview(ProReview r);

	void insertPoint(Point p);

	void updateOTableReviewOk(int orderNo);

	ProOrder selectOrder(int orderNo);

	ArrayList<Product> selectShopTreeList(ShopPageInfo pi);

	ArrayList<Product> selectShopEdibleList(ShopPageInfo pi);

	ArrayList<Product> selectShopFlowerList(ShopPageInfo pi);

	ArrayList<Product> selectShopEctList(ShopPageInfo pi);

	int productEctListCount();

	int productFlowerListCount();

	int productEdibleListCount();

	int productTreeListCount();

	Product selectShop(String proCode);

	ArrayList<ProReview> selectProReviewList(String proCode);

	int proReviewListCount(String proCode);

	ArrayList<Freebie> selectFreebieList();

	void insertOrder(ProOrder o);

	ArrayList<Product> selectBestSeller();

	ReviewLike selectLike(int reviewNo, int userNo);

	int insertLike(ReviewLike rLike);

	int likeCount(int reviewNo);

	ArrayList<Product> searchShopList(ShopPageInfo pi, String searchKeyword);

	Freebie selectFreebie(int freeNo);

	ArrayList<Product> sortList(ShopPageInfo pi, int sort);

	void buyFreebie(int freeNo);

	



	

}
