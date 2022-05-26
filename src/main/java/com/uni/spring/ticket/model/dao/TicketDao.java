package com.uni.spring.ticket.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Ticket;

@Repository
public class TicketDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.selectListCount");
	}

	public ArrayList<Ticket> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ticketMapper.selectList",null,rowBounds);
	
	}

}
