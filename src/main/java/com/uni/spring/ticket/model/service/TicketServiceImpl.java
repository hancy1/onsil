package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.ticket.model.dao.TicketDao;
import com.uni.spring.ticket.model.dto.PageInfo;
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

}
