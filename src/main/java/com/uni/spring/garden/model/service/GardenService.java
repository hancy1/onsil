package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;

public interface GardenService {

	ArrayList<VisitorBoard> getBoardList(String hostUser);

	int selectListCount(String hostUser);

	ArrayList<Board> selectList(PageInfo pi, String hostUser);

	void insertBoard(Map map);

	void deleteBoard(String boardNo);

	ArrayList<Neighbor> getNeighborList(String userNo);

	void deleteNeighbor(String neighborNo);

	void insertNeighbor(HashMap<String, String> map);

	void insertComment(HashMap<String, String> map);

	int selectCommentCount(String hostUser);

	ArrayList<Board> selectCommentList(PageInfo cPi, String hostUser);

	void updateComment(HashMap<String, String> map);

	void deleteComment(String commentNo);

	void updateBoard(HashMap<String, String> map);

	int selectPlantListCount();

	ArrayList<PlantInfo> selectPlantList(PageInfo pi);

	void insertPlant(PlantInfo info);

	void deletePlant(String regNo);


	

}
