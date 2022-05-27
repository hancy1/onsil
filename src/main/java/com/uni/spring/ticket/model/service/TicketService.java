package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Ticket;

public interface TicketService {

	int selectListCount();

	ArrayList<Ticket> selectListCount(PageInfo pi);

	void insertTicket(Ticket t);

}
