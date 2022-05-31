package com.uni.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.common.exception.CommException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	public Board selectBoard(int bno) {
		
		Board b = null;
		
		int result = boardDao.increaseCount(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("실패");
		}else {
			b = boardDao.selectBoard(sqlSession, bno);
		}
		
		return b;
	}

	@Override
	public void insertBoard(Board b) {
		
		int result = boardDao.insertBoard(sqlSession, b);
		
		if(result < 0) {
			throw new CommException("게시글 추가 실패");
		}
		
	}
}
