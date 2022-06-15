package com.uni.spring.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.shop.model.dao.ShopDao;
import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ReviewLike;
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
	public ArrayList<ProOrder> selectOrderCancelList(int userNo) {
		// TODO Auto-generated method stub
		return  shopDao.selectOrderCancelList(sqlSession,userNo);
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



	@Override
	public void cancelRequestOrder(int orderNo) {
		// TODO Auto-generated method stub
		
		int result = shopDao.cancelRequestOrder(sqlSession, orderNo);
		
		if(result <0) {
			throw new CommException("취소 요청 실패");
		}
	}



	@Override
	public void OkOrder(int orderNo) {
		// TODO Auto-generated method stub
		
		int result = shopDao.OkOrder(sqlSession, orderNo);
		
		if(result <0) {
			throw new CommException("주문 확정 실패");
		}
	}



	@Override
	public String selectProductCode(int orderNo) {
		// TODO Auto-generated method stub
		return shopDao.selectProductCode(sqlSession,orderNo);
	}



	@Override
	public void insertReview(ProReview r) {
		
		int result = shopDao.insertReview(sqlSession, r);
		
		if(result <0) {
			throw new CommException("장바구니 추가 실패");
		}	
	}



	@Override
	public void insertPoint(Point p) {
		// TODO Auto-generated method stub
		int result = shopDao.insertPoint(sqlSession, p);
		
		if(result <0) {
			throw new CommException("포인트자동 추가 실패");
		}	
	}


	
	//리뷰작성여부를 Y로 업데이트 
	@Override
	public void updateOTableReviewOk(int orderNo) {
		// TODO Auto-generated method stub
		int result = shopDao.updateOTableReviewOk(sqlSession, orderNo);
		
		if(result <0) {
			throw new CommException("리뷰작성여부 업데이트 실패");
		}
	}



	@Override
	public ProOrder selectOrder(int orderNo) {
		// TODO Auto-generated method stub
		return shopDao.selectOrder(sqlSession,orderNo);
	}



	@Override
	public ArrayList<Product> selectShopTreeList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  shopDao.selectShopTreeList(sqlSession,pi);
	}



	@Override
	public ArrayList<Product> selectShopEdibleList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  shopDao.selectShopEdibleList(sqlSession,pi);
	}



	@Override
	public ArrayList<Product> selectShopFlowerList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  shopDao.selectShopFlowerList(sqlSession,pi);
	}



	@Override
	public ArrayList<Product> selectShopEctList(ShopPageInfo pi) {
		// TODO Auto-generated method stub
		return  shopDao.selectShopEctList(sqlSession,pi);
	}



	@Override
	public int productEctListCount() {
		// TODO Auto-generated method stub
		return shopDao.productEctListCount(sqlSession);
	}



	@Override
	public int productFlowerListCount() {
		// TODO Auto-generated method stub
		return shopDao.productFlowerListCount(sqlSession);
	}



	@Override
	public int productEdibleListCount() {
		// TODO Auto-generated method stub
		return shopDao.productEdibleListCount(sqlSession);
	}



	@Override
	public int productTreeListCount() {
		// TODO Auto-generated method stub
		return shopDao.productTreeListCount(sqlSession);
	}



	@Override
	public Product selectShop(String proCode) {
		// TODO Auto-generated method stub
		return shopDao.selectShop(sqlSession,proCode);
	}



	@Override
	public ArrayList<ProReview> selectProReviewList(String proCode) {
		// TODO Auto-generated method stub
		return  shopDao.selectProReviewList(sqlSession,proCode);
	}



	@Override
	public int proReviewListCount(String proCode) {
		// TODO Auto-generated method stub
		return shopDao.proReviewListCount(sqlSession, proCode);
	}



	@Override
	public ArrayList<Freebie> selectFreebieList() {
		// TODO Auto-generated method stub
		return shopDao.selectFreebieList(sqlSession);
	}



	@Override
	public void insertOrder(ProOrder o) {
		// TODO Auto-generated method stub
		int result = shopDao.insertOrder(sqlSession, o);
		
		if(result <0) {
			throw new CommException("주문 추가 실패");
		}	
	}



	@Override
	public ArrayList<Product> selectBestSeller() {
		
		return shopDao.selectBestSeller(sqlSession);
	}



	@Override
	public ReviewLike selectLike(int reviewNo, int userNo) {
		// TODO Auto-generated method stub
		
		
		Map map = new HashMap<String, String>();
		map.put("reviewNo", reviewNo);
		map.put("userNo", userNo);
		
		return shopDao.selectLike(sqlSession, map);
	}



	@Override
	public int insertLike(ReviewLike rLike) {
		
	    // 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		// 좋아요가 이미 있는지 확인하는 코드
		ReviewLike find = shopDao.findLike(sqlSession, rLike);
		
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find==null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			result = shopDao.insertLike(sqlSession, rLike);
		} else {
			shopDao.deleteLike(sqlSession, rLike);
		}
		
	    // 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
	}



	@Override
	public int likeCount(int reviewNo) {
		// TODO Auto-generated method stub
		
		return shopDao.likeCount(sqlSession, reviewNo);
	}












}
