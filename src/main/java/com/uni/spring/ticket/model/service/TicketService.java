package com.uni.spring.ticket.model.service;

import java.util.ArrayList;

import com.uni.spring.ticket.model.dto.PageInfo;
import com.uni.spring.ticket.model.dto.Reservation;
import com.uni.spring.ticket.model.dto.Ticket;

public interface TicketService {

	int selectListCount();

	ArrayList<Ticket> selectListCount(PageInfo pi);

	void insertTicket(Ticket t);

	Ticket selectTicket(int bno);

	void deleteTicket(int bno);

	void updateTicket(Ticket t);

	int exhibitionListCount();

	ArrayList<Ticket> selectExhibitionList(PageInfo pi);

	Ticket selectExhibition(int ticketNo);

	int selectFairListCount();

	ArrayList<Ticket> selectFairList(PageInfo pi);

	Ticket selectFair(int ticketNo);

	Ticket selectReservation(String bno);

	
	ArrayList<Ticket> selectReservationList(String userNo);

	void insertReservation(Reservation re);



	

	

	
	

	

}
