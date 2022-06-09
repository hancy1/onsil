package com.uni.spring.shop.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Repository
public class ShopDao {

	public ArrayList<Point> selectMyPoint(SqlSessionTemplate sqlSession, String userNo1) {
		
		int userNo = Integer.parseInt(userNo1);
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectMyPoint",userNo);
	}

	public PointInfo selectPointTotal(SqlSessionTemplate sqlSession, String userNo1) {
		
		int userNo = Integer.parseInt(userNo1);
		return sqlSession.selectOne("shopMapper.selectPointTotal",userNo);
	}

	public int myReviewListCount(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.myReviewListCount",userNo);
	}

	public ArrayList<ProReview> selectMyReviewList(SqlSessionTemplate sqlSession, ShopPageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectMyReviewList", userNo, rowdounds);
	}

	public int increaseCountReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.increaseCountReview",reviewNo);
	}

	public ProReview selectReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectReview",reviewNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, ProReview r) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateReview",r);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.deleteReview",reviewNo);
	}

	public int productListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productListCount");
	}

	public ArrayList<Product> selectShopList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopList", null, rowdounds);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartList",userNo);
	}

	public ArrayList<ProOrder> selectOrderList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrderList",userNo);
	}

	public ArrayList<ProOrder> selectOrderCancelList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrderCancelList",userNo);
	}
	
	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.deleteCart",cartNo);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Map cartMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertCart", cartMap);
	}

	public int cancelRequestOrder(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.cancelRequestOrder",orderNo);
	}

	public int OkOrder(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.OkOrder",orderNo);
	}

	public String selectProductCode(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectProductCode",orderNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, ProReview r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertReview", r);
	}







}
