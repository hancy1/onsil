package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.RBoard;
import com.uni.spring.ticket.model.dto.Ticket;

public interface ReviewBoardService {

	int selectRBListCount();

	ArrayList<Ticket> selectListCount(PageInfo pi);

	void insertRBoard(RBoard rb);

	RBoard selectRBoard(int bno);

	
}
