package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.model.dao.AdminShopDao;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Service
public class AdminShopServiceImpl implements AdminShopService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private AdminShopDao aShopDao;
	
	@Override
	public int selectListCount() {
		
		return aShopDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  aShopDao.selectList(sqlSession,pi);
	}

	@Override
	public void insertProduct(Product p) {
		// TODO Auto-generated method stub
		
		int result = aShopDao.insertProduct(sqlSession, p);
		
		if(result <0) {
			throw new CommException("게시글 추가 실패");
		}
		
		
	}

}
