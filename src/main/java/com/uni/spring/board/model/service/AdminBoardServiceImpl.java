package com.uni.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.AdminBoardDao;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.common.exception.CommException;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminBoardDao adminBoardDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return adminBoardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return adminBoardDao.selectList(sqlSession, pi);
	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		int result = adminBoardDao.deleteBoard(sqlSession, bno);
		
		if(result < 0) { // 결과가 0보다 작으면 
			throw new CommException("신고된 게시글 삭제 실패");
		}
	}


}
