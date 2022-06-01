package com.uni.spring.shop.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.uni.spring.shop.model.dao.ShopDao;
import com.uni.spring.shop.model.dto.Point;

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

}
