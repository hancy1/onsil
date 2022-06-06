package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.ticket.model.dao.ReviewBoardDao;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Ticket;



@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewBoardDao rbDao;

	@Override
	public int selectRBListCount() {
		// TODO Auto-generated method stub
		return rbDao.selectRBListCount(sqlSession);
	}

	@Override
	public ArrayList<Ticket> selectListCount(PageInfo pi) {
		// TODO Auto-generated method stub
		return rbDao.selectList(sqlSession,pi);
	}
	
}
