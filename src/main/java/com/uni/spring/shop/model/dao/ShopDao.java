package com.uni.spring.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProReview;
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



}
