package com.uni.spring.ticket.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.help.model.dao.HelpDao;
import com.uni.spring.help.model.dto.Inquiry;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.ticket.model.dao.ReviewBoardDao;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBLike;
import com.uni.spring.ticket.model.dto.RBReply;
import com.uni.spring.ticket.model.dto.RBoard;
import com.uni.spring.ticket.model.dto.Ticket;



@Service
public class ReviewBoardServiceImpl implements ReviewBoardService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewBoardDao rbDao;

	
	//후기게시글 갯수 
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

	//후기게시판 글쓰기
	@Override
	public void insertRBoard(RBoard rb) {
	
		int result = rbDao.insertRBoard(sqlSession,rb);
		
		 if(result < 0) {
	         throw new CommException("게시글 등록 실패");
	      }
	}

	//후기게시판 상세보기
	@Override
	public RBoard selectRBoard(int bno) {
		// TODO Auto-generated method stub
		RBoard r = null;
		int result = rbDao.increaseCount(sqlSession, bno); // 조회수 올리기
	    if(result < 0) {
			
			throw new CommException("increaseCount 실패");
		}else {
			r = rbDao.selectRBoard(sqlSession,bno);
		}
		
		return r;
	}
	

	@Override
	public RBLike findHeart(int bno, int userNo) {
		
		// 2개의 parameter를 보내기 위해 Map 선언 및 Map에 데이터 삽입
		Map number = new HashMap<String, String>();
		number.put("rbNo", bno);
		number.put("userNo", userNo);
		return rbDao.findHeart(sqlSession,number);
	}

	//하트 눌렀을때
	@Override
	public int insertHeart(RBLike heart) {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		
		// 좋아요가 이미 있는지 확인하는 코드
		RBLike find = rbDao.findHeart(sqlSession,heart);
		
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find==null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			
			result = rbDao.insertHeart(sqlSession,heart);
		} else {
			rbDao.deleteHeart(sqlSession,heart);
		}
	    	// 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
	}

	
	@Override
	public ArrayList<RBReply> selectReplyList(int bno) {
		// TODO Auto-generated method stub
		return rbDao.selectReplyList(sqlSession,bno);
	}

	//후기게시판 수정하기 선택
	@Override
	public Object selectRborad(int bno) {
		// TODO Auto-generated method stub
		return rbDao.selectRborad(sqlSession,bno);
	}

	//게시글 수정하기
	@Override
	public void updateRBoard(RBoard rb) {
		
		int result=rbDao.updateBRboard(sqlSession, rb);
	    if(result < 0) {
	         throw new CommException("게시글 수정 실패");
	      }
	      
}

	//게시글 삭제하기
	@Override
	public void deleteRBoard(int bno) {
		  
		int result = rbDao.deleteRBoard(sqlSession, bno);
		      
		      if(result < 0) {
		         throw new CommException("게시글 삭제 실패");
		      }
		      
	}

	//후기게시판 댓글 등록
	@Override
	public int insertReply(RBReply rb) {
	
		int result = rbDao.insertReply(sqlSession, rb);
		
		if(result < 0) {
			throw new CommException("댓글 추가 실패");
		}
		
		return result;	
	}

	//댓글삭제
	@Override
	public int deleteReply(int replyNo) {

		int result = rbDao.deleteReply(sqlSession, replyNo);
		
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		
		return result;
	}

	//댓글수정
	@Override
	public int updateReply(RBReply rb) {
	
		int result = rbDao.updateReply(sqlSession, rb);
		
		if(result < 0) {
			throw new CommException("댓글 수정 실패");
		}
		
		return result;
	}

	@Override
	public int selectReviewListCount() {
		// TODO Auto-generated method stub
		return rbDao.selectReviewListCount(sqlSession);
	}

	@Override
	public ArrayList<ProReview> selectReviewList(PageInfo pi) {
		// TODO Auto-generated method stub
		return rbDao.selectReviewList(sqlSession,pi);
	}

	@Override
	public void deleteARBBoard(int bno) {
		// TODO Auto-generated method stub
		  int result = rbDao.deleteARBBoard(sqlSession, bno);
	      
	      if(result < 0) {
	         throw new CommException(" 삭제 실패");
	      }
}
	
	
	
	
	

	
	
	
}
