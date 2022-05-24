package com.uni.spring.garden.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.garden.model.dao.GardenDao;
import com.uni.spring.garden.model.dto.VisitorBoard;



@Service
public class GardenServiceImpl implements GardenService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GardenDao gardenDao;

	@Override
	public ArrayList<VisitorBoard> getBoardList(String hostUser) {
		
		ArrayList<VisitorBoard> list = gardenDao.getBoardList(hostUser, sqlSession);
		
		System.out.println("서비스 list" + list);
		
		return list;
	}

	
}
