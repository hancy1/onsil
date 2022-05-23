package com.uni.spring.garden.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.garden.model.dao.GardenDao;



@Service
public class GardenServiceImpl implements GardenService{

	//@Autowired
	//private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GardenDao gardenDao;
}
