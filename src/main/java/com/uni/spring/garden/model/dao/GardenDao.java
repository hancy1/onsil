package com.uni.spring.garden.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.garden.model.dto.DailyLog;
import com.uni.spring.garden.model.dto.DailyLogComment;
import com.uni.spring.garden.model.dto.MyPlant;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.PlantGrow;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.dto.VisitorComment;

@Repository
public class GardenDao {

	//메인화면에서 보이는 3개의 최신 방명록구하는 쿼리
	public ArrayList<VisitorBoard> getBoardList(String hostUser, SqlSessionTemplate sqlSession) {
		
		ArrayList<VisitorBoard> list = (ArrayList)sqlSession.selectList("gardenMapper.getBoardList", hostUser);
		
		return list;
	}

	public int selectListCount(SqlSessionTemplate sqlSession, String hostUser) {
		
		return sqlSession.selectOne("gardenMapper.selectListCount", hostUser);
	}

	//방명록 화면에서 모든 방명록 구하는 쿼리
	public ArrayList<VisitorBoard> getBoardList(String hostUser, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gardenMapper.getBoardListAll", hostUser, rowBounds);

	}

	public int insertBoard(Map map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertBoard", map);
	}

	public int deleteBoard(String boardNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("gardenMapper.deleteBoard", boardNo);
		
	}

	public ArrayList<Neighbor> getNeighborList(String hostUser, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.getNeighborList", hostUser);

	}

	public int deleteNeighbor(String neighborNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.delete("gardenMapper.deleteNeighbor", neighborNo);
	}

	public int insertNeighbor(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("gardenMapper.insertNeighbor", map);		
	}

	public int insertComment(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertComment", map);	
	}

	public int selectCommentCount(String hostUser, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectCommentCount", hostUser);
	}

	public ArrayList<VisitorComment> selectCommentList(String hostUser, PageInfo cPi, SqlSessionTemplate sqlSession) {
		
		int offset = (cPi.getCurrentPage() - 1) * cPi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, cPi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectCommentList", hostUser, rowBounds);
	}

	public int updateComment(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updateComment", map);	
	}

	public int deleteComment(String commentNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.deleteComment", commentNo);	
	}

	public int updateBoard(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updateBoard", map);
	}

	public int selectPlantListCount(String search, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectPlantListCount",search);
	}

	public ArrayList<PlantInfo> selectPlantList(PageInfo pi, String search, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectPlantList", search, rowBounds);
	}

	public int insertPlant(PlantInfo info, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertPlant", info);
	}

	public int deletePlant(String regNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.delete("gardenMapper.deletePlant", regNo);
	}

	public PlantInfo selectPlantInfo(String regNo, SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("gardenMapper.selectPlantInfo", regNo);
	}

	public int updatePlantInfo(PlantInfo info, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updatePlantInfo", info);
	}

	public int selectLogCount(String hostUser, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectLogCount", hostUser);
	}

	public ArrayList<DailyLog> selectLogList(String hostUser, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectLogList", hostUser, rowBounds);
	}

	public DailyLog selectLog(String logNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectLog", logNo);
	}

	public int insertDailyLog(DailyLog log, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertDailyLog", log);
	}

	public int selectLogCommentCount(String logNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectLogCommentCount", logNo);
	}

	public ArrayList<DailyLogComment> selectLogCommentList(String logNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectLogCommentList", logNo);
	}

	public int updateDailylog(DailyLog log, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updateDailylog", log);
	}

	public int deleteDailyLog(String logNo, SqlSessionTemplate sqlSession) {	
		
		//해당 데일리로그를 삭제하면 로그에 달린 댓글도 상태를 N으로 업데이트한다.
		sqlSession.update("gardenMapper.deleteDailyLogComment", logNo);
		
		return sqlSession.update("gardenMapper.deleteDailyLog", logNo);
	}

	public int insertLogComment(DailyLogComment comment, SqlSessionTemplate sqlSession) {
		
		sqlSession.insert("gardenMapper.insertLogComment", comment);
		
		return sqlSession.update("gardenMapper.updateCommentGroup", comment);
	}

	public int insertLogReComment(DailyLogComment comment, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertLogReComment", comment);
	}

	public int deleteLogComment(String commentNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.deleteLogComment", commentNo);
	}

	public int updateLogComment(DailyLogComment comment, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updateLogComment", comment);
	}

	public ArrayList<DailyLog> selectRecentLog(String hostUser, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectRecentLog", hostUser);
	}

	public int selectMyPlantCount(String hostUser, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectMyPlantCount", hostUser);
	}

	public ArrayList<MyPlant> selectMyPlantList(String hostUser, PageInfo pi, SqlSessionTemplate sqlSession) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("gardenMapper.selectMyPlantList", hostUser, rowBounds);
	}

	public int insertMyPlant(MyPlant myPlant, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertMyPlant", myPlant);
	}

	public MyPlant selectMyPlant(String plantNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectMyPlant", plantNo);
	}

	public int selectGrowListCount(String plantNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectGrowListCount", plantNo);
	}

	public ArrayList<PlantGrow> selectGrowList(String plantNo, SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("gardenMapper.selectGrowList", plantNo);
	}

	public int deleteGrowList(String listNo, SqlSessionTemplate sqlSession) {

		return sqlSession.update("gardenMapper.deleteGrowList", listNo);
	}

	public int updateMyPlant(MyPlant plant, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updateMyPlant", plant);
	}

	public int deleteMyPlant(String plantNo, SqlSessionTemplate sqlSession) {
		sqlSession.update("gardenMapper.deleteMyPlantGrow", plantNo);
		
		return sqlSession.update("gardenMapper.deleteMyPlant", plantNo);
	}

	public List<PlantGrow> selectCalendar(String hostUser, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("gardenMapper.selectCalendar", hostUser);
	}

	public int insertPlantGrow(PlantGrow plant, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("gardenMapper.insertPlantGrow", plant);
	}

	public PlantGrow selectPlantGrow(String listNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.selectPlantGrow", listNo);
	}

	public int updatePlantGrow(PlantGrow plant, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.updatePlantGrow", plant);
	}

	public ArrayList<VisitorComment> getCommentList(String hostUser, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.getCommentList", hostUser);
	}

	public ArrayList<PlantGrow> selectPlantGrowAlert(String userNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.selectPlantGrowAlert", userNo);
	}

	public int checkNeighbor(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("gardenMapper.checkNeighbor", map);
	}

	public int checkMemberId(String nUserId, SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("gardenMapper.checkMemberId", nUserId);
	}

	
		
		
	

}
