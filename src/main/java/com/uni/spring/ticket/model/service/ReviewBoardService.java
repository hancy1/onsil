package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBLike;
import com.uni.spring.ticket.model.dto.RBReply;
import com.uni.spring.ticket.model.dto.RBoard;
import com.uni.spring.ticket.model.dto.Ticket;

public interface ReviewBoardService {

	int selectRBListCount();

	ArrayList<Ticket> selectListCount(PageInfo pi);

	void insertRBoard(RBoard rb);

	RBoard selectRBoard(int bno);

	RBLike findHeart(int bno, int userNo);

	int insertHeart(RBLike heart);

	ArrayList<RBReply> selectReplyList(int bno);


	Object selectRborad(int bno);

	void updateRBoard(RBoard rb);

	void deleteRBoard(int bno);

	int insertReply(RBReply rb);

	int deleteReply(int replyNo);

	int updateReply(RBReply rb);

	

	

	
	
}
