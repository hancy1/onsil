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

	public int insertTicket(SqlSessionTemplate sqlSession, Ticket t) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ticketMapper.insertTicket",t);
	}

	public Ticket selectTicket(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.selectTicket",bno);
	}

	public int deleteTicket(SqlSessionTemplate sqlSession, int bno) {
		// TODO Auto-generated method stub
		return sqlSession.update("ticketMapper.deleteTicket",bno);
	}

	public int updateTicket(SqlSessionTemplate sqlSession, Ticket t) {
		// TODO Auto-generated method stub
		return sqlSession.delete("ticketMapper.updateTicket",t);
	}

	public int exhibitionListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.exhibitionListCount");
	}

	public ArrayList<Ticket> selectExhibitionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ticketMapper.selectExhibitionList", null,rowBounds);
	}

	public Ticket selectExhibition(SqlSessionTemplate sqlSession, int ticketNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.selectExhibition",ticketNo);
	}

	public int selectFairListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.selectFairListCount");
	}

	public ArrayList<Ticket> selectFairList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ticketMapper.selectFairList", null,rowBounds);
	}

	public Ticket selectFair(SqlSessionTemplate sqlSession, int ticketNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ticketMapper.selectFair",ticketNo);

	}

}
