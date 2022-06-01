package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;

public interface ShopService {

	ArrayList<Point> selectMyPoint(String userNo);

	PointInfo selectPointTotal(String userNo);

}
