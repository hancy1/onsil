package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.ShopPageInfo;

public interface ShopService {

	ArrayList<Point> selectMyPoint(String userNo);

	PointInfo selectPointTotal(String userNo);

	int myReviewListCount(int userNo);

	ArrayList<ProReview> selectMyReviewList(ShopPageInfo pi, int userNo);

}
