package com.uni.spring.ticket.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.ticket.model.dao.TicketDao;
import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Reservation;
import com.uni.spring.ticket.model.dto.Ticket;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TicketDao ticketDao;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return ticketDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Ticket> selectListCount(PageInfo pi) {
		// TODO Auto-generated method stub
		return ticketDao.selectList(sqlSession,pi);
	}

	@Override
	public void insertTicket(Ticket t) {
		
		int result = ticketDao.insertTicket(sqlSession,t);
		
		 if(result < 0) {
	         throw new CommException("티켓등록 추가 실패");
	      }
	}

	@Override
	public Ticket selectTicket(int bno) {
		// TODO Auto-generated method stub
		return ticketDao.selectTicket(sqlSession,bno);
	}

	@Override
	public void deleteTicket(int bno) {
		   int result = ticketDao.deleteTicket(sqlSession, bno);
		      
		      if(result < 0) {
		         throw new CommException("티켓 삭제 실패");
		      }
	}

	@Override
	public void updateTicket(Ticket t) {
		int result = ticketDao.updateTicket(sqlSession, t);
	      
	      if(result < 0) {
	         throw new CommException("티켓수정 실패");
	      }
	}

	//전시회
	@Override
	public int exhibitionListCount() {
		// TODO Auto-generated method stub
		return ticketDao.exhibitionListCount(sqlSession);
	}

	@Override
	public ArrayList<Ticket> selectExhibitionList(PageInfo pi) {
		// TODO Auto-generated method stub
		return ticketDao.selectExhibitionList(sqlSession,pi);
	}

	@Override
	public Ticket selectExhibition(int ticketNo) {
		// TODO Auto-generated method stub
		return ticketDao.selectExhibition(sqlSession,ticketNo);
	}

	@Override
	public int selectFairListCount() {
		// TODO Auto-generated method stub
		return ticketDao.selectFairListCount(sqlSession);
	}

	@Override
	public ArrayList<Ticket> selectFairList(PageInfo pi) {
		// TODO Auto-generated method stub
		return ticketDao.selectFairList(sqlSession,pi);
	}

	@Override
	public Ticket selectFair(int ticketNo) {
		// TODO Auto-generated method stub
		return ticketDao.selectFair(sqlSession,ticketNo);
	}

	@Override
	public Ticket selectReservation(String bno) {
		// TODO Auto-generated method stub
		return ticketDao.selectReservation(sqlSession,bno);
	}



	@Override
	public ArrayList<Ticket> selectReservationList(String userNo) {
		// TODO Auto-generated method stub
		return ticketDao.selectReservationList(sqlSession,userNo);
	}

	@Override
	public void insertReservation(Reservation re) {
		// TODO Auto-generated method stub
     int result = ticketDao.insertReservation(sqlSession, re);
		
		if(result <0) {
			throw new CommException("에약 추가 실패");
		}
	}

	@Override
	public void deleteRv(int ticketNo) {
      int result = ticketDao.deleteRv(sqlSession, ticketNo);
		
		if(result < 0) { // 결과가 0보다 작으면 
			throw new CommException("에약 삭제 실패");
		
	}

	}
}


	

	
		
	

	
	




	

	

	


