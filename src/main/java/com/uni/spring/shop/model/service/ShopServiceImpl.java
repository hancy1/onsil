package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.uni.spring.shop.model.dao.ShopDao;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;

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

}