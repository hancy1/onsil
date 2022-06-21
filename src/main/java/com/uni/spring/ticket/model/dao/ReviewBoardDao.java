package com.uni.spring.ticket.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBLike;
import com.uni.spring.ticket.model.dto.RBReply;
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
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("reviewBoardmapper.selectList", null, rowBounds);

	}

	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewBoardmapper.increaseCount", bno);
	}

	//게시글 등록
	public int insertRBoard(SqlSessionTemplate sqlSession, RBoard rb) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewBoardmapper.insertRBoard", rb);
	}

	public RBoard selectRBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.selectRBoard", bno);
	}

	// 좋아요가 DB에 있는지 확인
	public RBLike findHeart(SqlSessionTemplate sqlSession, Map number) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.checkHeart", number);
	}

	public RBLike findHeart(SqlSessionTemplate sqlSession, RBLike heart) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.findHeart", heart);
	}

	public int insertHeart(SqlSessionTemplate sqlSession, RBLike heart) {
		// TODO Auto-generated method stub
		
		 
		return sqlSession.insert("reviewBoardmapper.insertHeart", heart);
	}

	public void deleteHeart(SqlSessionTemplate sqlSession, RBLike heart) {
		// TODO Auto-generated method stub

		sqlSession.delete("reviewBoardmapper.deleteHeart", heart);

	}

	//후기게시글 댓글
	public int insertReply(SqlSessionTemplate sqlSession, RBReply rb) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reviewBoardmapper.insertReply", rb);
	}

	public ArrayList<RBReply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		

		return (ArrayList) sqlSession.selectList("reviewBoardmapper.selectReplyList", bno);
	}

	// 게시글 상세보기
	public Object selectRborad(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.selectRborad", bno);
	}

	// 게시글 수정하기
	public int updateBRboard(SqlSessionTemplate sqlSession, RBoard rb) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reviewBoardmapper.updateBRboard", rb);
	}

	// 게시글 삭제하기
	public int deleteRBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewBoardmapper.deleteRBoard", bno);
	}

	//댓글삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("reviewBoardmapper.deleteReply", replyNo);
	}

	//댓글수정
	public int updateReply(SqlSessionTemplate sqlSession, RBReply rb) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewBoardmapper.updateReply", rb);
	}

	//관리자 후기게시판 관리
	public int selectReviewListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reviewBoardmapper.selectReviewListCount");
	}

	public ArrayList<ProReview> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("reviewBoardmapper.selectReviewList", null, rowBounds);

	}

	public int deleteARBBoard(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewBoardmapper.deleteARBBoard",bno);
	}



}
