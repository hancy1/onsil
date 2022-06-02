package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.model.dto.DailyLog;
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

	int selectPlantListCount(String search);

	ArrayList<PlantInfo> selectPlantList(PageInfo pi, String search);

	void insertPlant(PlantInfo info);

	void deletePlant(String regNo);

	PlantInfo selectPlantInfo(String regNo);

	void updatePlantInfo(PlantInfo info);

	int selectLogCount(String hostUser);

	ArrayList<DailyLog> selectLogList(String hostUser, PageInfo pi);

	DailyLog selectLog(String logNo);

	void insertDailyLog(DailyLog log);


	

}
