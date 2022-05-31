package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

public interface AdminShopService {

	int selectListCount();

	ArrayList<Product> selectList(ShopPageInfo pi);

	void insertProduct(Product p);

	Product selectProduct(String proCode);

	void deleteProduct(String proCode);

	void updateProduct(Product p);

	int freebieListCount();

	ArrayList<Freebie> selectFreebieList(ShopPageInfo pi);

	void insertFreebie(Freebie f);

}
