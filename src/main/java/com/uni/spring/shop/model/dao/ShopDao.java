package com.uni.spring.shop.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;

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

}
