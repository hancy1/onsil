package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.model.dao.AdminShopDao;
import com.uni.spring.shop.model.dto.Freebie;
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
			throw new CommException("판매제품 추가 실패");
		}
		
		
	}

	@Override
	public Product selectProduct(String proCode) {
		// TODO Auto-generated method stub
		
		
		Product p = null;	
		p=aShopDao.selectProduct(sqlSession, proCode);
		
		
		return p;
	}

	
	
	@Override
	public void deleteProduct(String proCode) {
		// TODO Auto-generated method stub
		
		int result = aShopDao.deleteProduct(sqlSession, proCode);
		
		if(result <0) {
			throw new CommException("제품 판매중지 실패");
		}
		
		
	}

	@Override
	public void updateProduct(Product p) {
		// TODO Auto-generated method stub

		int result = aShopDao.updateProduct(sqlSession, p);
		
		if(result <0) {
			throw new CommException("판매제품 수정 실패");
		}
	}

	@Override
	public int freebieListCount() {
		// TODO Auto-generated method stub
		return aShopDao.freebieListCount(sqlSession);
	}

	@Override
	public ArrayList<Freebie> selectFreebieList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return aShopDao.selectFreebieList(sqlSession,pi);
	}

	@Override
	public void insertFreebie(Freebie f) {
		
		int result = aShopDao.insertFreebie(sqlSession, f);
		
		if(result <0) {
			throw new CommException("사은품 추가 실패");
		}
		
		
	}

}
