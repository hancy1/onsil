package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.model.dao.AdminShopDao;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.ProStock;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Service
public class AdminShopServiceImpl implements AdminShopService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private AdminShopDao aShopDao;
	
	
	//판매제품영역
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

	//사은품 영역
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

	@Override
	public Freebie selectFreebie(int freeNo) {
		Freebie f = null;	
		f=aShopDao.selectFreebie(sqlSession, freeNo);
		
		
		return f;
	}

	@Override
	public void deleteFreebie(int freeNo) {
		int result = aShopDao.deleteFreebie(sqlSession, freeNo);
		
		if(result <0) {
			throw new CommException("사은품 삭제 실패");
		}
		
	}

	@Override
	public void updateFreebie(Freebie f) {
		
		int result = aShopDao.updateFreebie(sqlSession, f);
		
		if(result <0) {
			throw new CommException("사은품 수정 실패");
		}
		
	}

	
	
	//리뷰영역
	@Override
	public int reviewListCount() {
		// TODO Auto-generated method stub
		return aShopDao.reviewListCount(sqlSession);
	}

	@Override
	public ArrayList<ProReview> selectReviewList(ShopPageInfo pi) {
		return aShopDao.selectReviewList(sqlSession,pi);
	}

	@Override
	public void deleteAdminReview(int reviewNo) {
		
		int result = aShopDao.deleteAdminReview(sqlSession, reviewNo);
		
		if(result <0) {
			throw new CommException("리뷰 삭제 실패");
		}
	}

	
	//인벤토리(재고영역)
	
	@Override
	public int inventoryListCount() {
		// TODO Auto-generated method stub
		return aShopDao.inventoryListCount(sqlSession);
	}

	@Override
	public ArrayList<ProStock> selectInventoryList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return aShopDao.selectInventoryList(sqlSession,pi);
	}


}
