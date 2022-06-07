package com.uni.spring.shop.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.model.dao.ShopDao;
import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private ShopDao shopDao;
	
	
	
	@Override
	public ArrayList<Point> selectMyPoint(String userNo) {
		
		return  shopDao.selectMyPoint(sqlSession,userNo);
	}



	@Override
	public PointInfo selectPointTotal(String userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectPointTotal(sqlSession,userNo);
	}



	@Override
	public int myReviewListCount(int userNo) {
		// TODO Auto-generated method stub
		return shopDao.myReviewListCount(sqlSession, userNo);
	}



	@Override
	public ArrayList<ProReview> selectMyReviewList(ShopPageInfo pi, int userNo) {
		// TODO Auto-generated method stub
		return shopDao.selectMyReviewList(sqlSession,pi,userNo);
	}



	@Override
	public ProReview selectReview(int reviewNo) {
		// TODO Auto-generated method stub
		
		
		ProReview r = null;
		int result = shopDao.increaseCountReview(sqlSession, reviewNo);
		
		if(result<0) {
			throw new CommException("리뷰 조횟수 불러오기 실패");			
						
		}else {
			r=shopDao.selectReview(sqlSession, reviewNo);						
		}		
		
		return r;
		
		
		
	}



	@Override
	public void updateReview(ProReview r) {
		// TODO Auto-generated method stub
		
		int result = shopDao.updateReview(sqlSession, r);
		
		if(result <0) {
			throw new CommException("리뷰 수정 실패");
		}
		
	}


	//리뷰삭제
	@Override
	public void deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		
		int result = shopDao.deleteReview(sqlSession, reviewNo);
		
		if(result <0) {
			throw new CommException("리뷰 삭제 실패");
		}	
	}



	@Override
	public int productListCount() {
		// TODO Auto-generated method stub
		return shopDao.productListCount(sqlSession);
	}



	@Override
	public ArrayList<Product> selectShopList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  shopDao.selectShopList(sqlSession,pi);
	}



	@Override
	public ArrayList<Cart> selectCartList(int userNo) {
		// TODO Auto-generated method stub
		return  shopDao.selectCartList(sqlSession,userNo);
	}



	@Override
	public ArrayList<ProOrder> selectOrderList(int userNo) {
		// TODO Auto-generated method stub
		return  shopDao.selectOrderList(sqlSession,userNo);
	}



	@Override
	public void deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		
		int result = shopDao.deleteCart(sqlSession, cartNo);
		
		if(result <0) {
			throw new CommException("장바구니 삭제 실패");
		}	
		
		
	}



	@Override
	public void insertCart(Map cartMap) {
		// TODO Auto-generated method stub
		
		int result = shopDao.insertCart(sqlSession, cartMap);
		
		if(result <0) {
			throw new CommException("장바구니 추가 실패");
		}
	}





}
