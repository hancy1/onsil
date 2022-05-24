package com.uni.spring.garden.model.service;

import java.util.ArrayList;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;

public interface GardenService {

	ArrayList<VisitorBoard> getBoardList(String hostUser);

	int selectListCount(String hostUser);

	ArrayList<Board> selectList(PageInfo pi, String hostUser);

}
