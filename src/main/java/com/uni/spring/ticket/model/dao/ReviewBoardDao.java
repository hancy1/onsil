package com.uni.spring.ticket.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBLike;
import com.uni.spring.ticket.model.dto.RBoard;
import com.uni.spring.ticket.model.dto.Ticket;

@Repository
public class ReviewBoardDao {

	public int selectRBListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.selectRBListCount");
	}

	public ArrayList<Ticket> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reviewBoardmapper.selectList",null,rowBounds);
	
	}

	public int insertRBoard(SqlSessionTemplate sqlSession, RBoard rb) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewBoardmapper.insertRBoard",rb);
	}

	public RBoard selectRBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.selectRBoard",bno);
	}

	public RBLike findHeart(SqlSessionTemplate sqlSession, Map<String, Integer> number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.findHeart",number);
	}

	public RBLike findHeart(SqlSessionTemplate sqlSession,RBLike heart) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.findHeart",heart);
	}

	public int insertHeart(SqlSessionTemplate sqlSession,RBLike heart) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewBoardmapper.insertHeart", heart);
	}

	public void deleteHeart(SqlSessionTemplate sqlSession,RBLike heart) {
		// TODO Auto-generated method stub
		
		sqlSession.delete("reviewBoardmapper.deleteHeart",heart);
		
	}

}
