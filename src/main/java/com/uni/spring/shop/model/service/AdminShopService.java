package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

public interface AdminShopService {

	int selectListCount();

	ArrayList<Product> selectList(ShopPageInfo pi);

	void insertProduct(Product p);

}
