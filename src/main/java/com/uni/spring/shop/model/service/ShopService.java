package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Point;

public interface ShopService {

	ArrayList<Point> selectMyPoint(String userNo);

}
