package com.uni.spring.ticket.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
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

	@Override
	public void insertRBoard(RBoard rb) {
	
		int result = rbDao.insertRBoard(sqlSession,rb);
		
		 if(result < 0) {
	         throw new CommException("게시글 등록 실패");
	      }
	}

	@Override
	public RBoard selectRBoard(int bno) {
		// TODO Auto-generated method stub
		return rbDao.selectRBoard(sqlSession,bno);
	}

	@Override
	public RBLike findHeart(int bno, int userNo) {
		
		// 2개의 parameter를 보내기 위해 Map 선언 및 Map에 데이터 삽입
		Map<String, Integer> number = new HashMap<String, Integer>();
		number.put("rbNo", bno);
		number.put("userNo", userNo);
		return rbDao.findHeart(sqlSession,number);
	}

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

	@Override
	public Object selectRborad(int bno) {
		// TODO Auto-generated method stub
		return rbDao.selectRborad(sqlSession,bno);
	}

	

	
	
	
}
