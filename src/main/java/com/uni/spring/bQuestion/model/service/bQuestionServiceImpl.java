package com.uni.spring.bQuestion.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.uni.spring.bQuestion.model.dao.bQuestionDao;
import com.uni.spring.board.model.dao.BoardDao;

public class bQuestionServiceImpl implements bQuestionService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private bQuestionDao bQuestionDao;
}
