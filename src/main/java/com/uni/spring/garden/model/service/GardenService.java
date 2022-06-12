package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.uni.spring.garden.model.dto.DailyLog;
import com.uni.spring.garden.model.dto.DailyLogComment;
import com.uni.spring.garden.model.dto.MyPlant;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.PlantGrow;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.dto.VisitorComment;

public interface GardenService {

	ArrayList<VisitorBoard> getBoardList(String hostUser);

	int selectListCount(String hostUser);

	ArrayList<VisitorBoard> selectList(PageInfo pi, String hostUser);

	void insertBoard(Map map);

	void deleteBoard(String boardNo);

	ArrayList<Neighbor> getNeighborList(String hostUser);

	void deleteNeighbor(String neighborNo);

	void insertNeighbor(HashMap<String, String> map);

	void insertComment(HashMap<String, String> map);

	int selectCommentCount(String hostUser);

	ArrayList<VisitorComment> selectCommentList(PageInfo cPi, String hostUser);

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

	int selectLogCommentCount(String logNo);

	ArrayList<DailyLogComment> selectLogCommentList(String logNo);

	void updateDailylog(DailyLog log);

	void deleteDailyLog(String logNo);

	int insertLogComment(DailyLogComment comment);

	int insertLogReComment(DailyLogComment comment);

	int deleteLogComment(String commentNo);

	int updateLogComment(DailyLogComment comment);

	ArrayList<DailyLog> selectRecentLog(String hostUser);

	int selectMyPlantCount(String hostUser);

	ArrayList<MyPlant> selectMyPlantList(String hostUser, PageInfo pi);

	void insertMyPlant(MyPlant myPlant);

	MyPlant selectMyPlant(String plantNo);

	int selectGrowListCount(String plantNo);

	ArrayList<PlantGrow> selectGrowList(String plantNo);

	int deleteGrowList(String listNo);

	void updateMyPlant(MyPlant plant);

	int deleteMyPlant(String plantNo);

	List<PlantGrow> selectCalendar(String hostUser);

	void insertPlantGrow(PlantGrow plant);

	PlantGrow selectPlantGrow(String listNo);

	void updatePlantGrow(PlantGrow plant);

	ArrayList<VisitorComment> getCommentList(String hostUser);

	ArrayList<PlantGrow> selectPlantGrowAlert(String userNo);

	int checkNeighbor(HashMap<String, String> map);

	int checkMemberId(String nUserId);


	

}
