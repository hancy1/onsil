package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;

public interface GardenService {

	ArrayList<VisitorBoard> getBoardList(String hostUser);

	int selectListCount(String hostUser);

	ArrayList<Board> selectList(PageInfo pi, String hostUser);

	void boardEnroll(Map map);

	void boardDelete(String boardNo);

	ArrayList<Neighbor> getNeighborList(String userNo);

	

}
