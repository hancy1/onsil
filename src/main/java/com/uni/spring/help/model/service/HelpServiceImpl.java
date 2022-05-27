package com.uni.spring.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.help.model.dao.HelpDao;
import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.PageInfo;
import com.uni.spring.member.model.dao.MemberDao;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private HelpDao helpDao;


	@Override // 자주묻는질문 게시물 갯수 구하기
	public int selectFaqListCount() {
		
		return HelpDao.selectFaqListCount(sqlSession);
	}


	@Override // 자주묻는질문 게시물 가져오기
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		
		return HelpDao.selectFaqList(sqlSession, pi);
	}
}
