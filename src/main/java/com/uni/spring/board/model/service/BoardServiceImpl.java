package com.uni.spring.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dao.BoardDao;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.dto.Reply;
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

	@Override
	public void deleteBoard(int bno) {

		int result = boardDao.deleteBoard(sqlSession, bno);
		
		if(result < 0) { // 결과가 0보다 작으면 
			throw new CommException("게시글 삭제 실패");
		}
		
	}

	@Override
	public void updateBoard(Board b) {
		
		int result = boardDao.updateBoard(sqlSession, b);
		System.out.println(result);
		
		if(result < 0) { // 0보다 작으면
			throw new CommException("게시글 수정 실패");
		}
		
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		// TODO Auto-generated method stub
		return boardDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		
		int result = boardDao.insertReply(sqlSession, r);
		
		if(result < 0) {
			throw new CommException("댓글 작성 실패");
		}
		return result;
	}

	@Override
	public int deleteReply(int reno) {
		
		int result = boardDao.deleteReply(sqlSession, reno);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
	}
	
	@Override
	public int bReportBoard(int bno, int bReport) {
		
		Map<String, Object> bReportMap = new HashMap<String, Object>();
		
		bReportMap.put("bno", bno);
		bReportMap.put("bReport", bReport);
		
		int result = boardDao.bReportBoard(sqlSession, bReportMap);
		
		if(result < 0) { // 결과가 0보다 작으면 
			throw new CommException("게시글 신고 실패");
		}		
		return result;
	}

}
