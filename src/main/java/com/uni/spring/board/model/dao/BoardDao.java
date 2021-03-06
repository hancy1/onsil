package com.uni.spring.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.dto.Reply;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		//System.out.println("다오 글 목록" + offset + rowBounds);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.increaseCount", bno);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		//System.out.println("다오 글번호 선택" + bno);
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		//System.out.println("다오 글삭제 글번호 확인" + bno);
		return sqlSession.update("boardMapper.deleteBoard", bno);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub		
		return sqlSession.update("boardMapper.updateBoard", b);
		//System.out.println("다오 : " + a);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return  (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bno);
	}			// 반환되는 타입으로 형변환

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, int reno) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.deleteReply", reno);
	}
	
	public int bReportBoard(SqlSessionTemplate sqlSession, Map<String, Object> bReportMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.bReportBoard", bReportMap);
	}

}
