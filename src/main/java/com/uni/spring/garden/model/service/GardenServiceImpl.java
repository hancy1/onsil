package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.common.exception.CommException;
import com.uni.spring.garden.model.dao.GardenDao;
import com.uni.spring.garden.model.dto.DailyLog;
import com.uni.spring.garden.model.dto.DailyLogComment;
import com.uni.spring.garden.model.dto.MyPlant;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.PlantGrow;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.dto.VisitorComment;



@Service
public class GardenServiceImpl implements GardenService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GardenDao gardenDao;

	@Override
	public ArrayList<VisitorBoard> getBoardList(String hostUser) {
		
		ArrayList<VisitorBoard> list = gardenDao.getBoardList(hostUser, sqlSession);
		
		return list;
	}

	@Override
	public int selectListCount(String hostUser) {
		
		return gardenDao.selectListCount(sqlSession, hostUser);
	}

	@Override
	public ArrayList<VisitorBoard> selectList(PageInfo pi, String hostUser) {
		
		return gardenDao.getBoardList(hostUser, pi, sqlSession);
	}

	@Override
	public int insertBoard(Map map) {
		
		int result = gardenDao.insertBoard(map, sqlSession);
		
		if(result < 0) {
			throw new CommException("방명록 작성 실패");
		}
		return result;
		
	}

	@Override
	public int deleteBoard(String boardNo) {
		int result = gardenDao.deleteBoard(boardNo, sqlSession);	
		
		if(result < 0) {
			throw new CommException("방명록 삭제 실패");
		}
		
		return result;
		
	}

	@Override
	public ArrayList<Neighbor> getNeighborList(String hostUser) {
		
		return gardenDao.getNeighborList(hostUser, sqlSession);
	}

	@Override
	public void deleteNeighbor(String neighborNo) {
		int result = gardenDao.deleteNeighbor(neighborNo, sqlSession);
		
		if(result < 0) {
			throw new CommException("이웃 삭제 실패");
		}
		
	}

	@Override
	public void insertNeighbor(HashMap<String, String> map) {
		int result =  gardenDao.insertNeighbor(map, sqlSession);
		if(result < 0) {
			throw new CommException("이웃 추가 실패");
		}
	}

	@Override
	public int insertComment(HashMap<String, String> map) {

		int result =  gardenDao.insertComment(map, sqlSession);
		if(result < 0) {
			throw new CommException("댓글 작성 실패");
		}
		return result;
		
	}

	@Override
	public int selectCommentCount(String hostUser) {
		return gardenDao.selectCommentCount(hostUser,  sqlSession);
	}

	@Override
	public ArrayList<VisitorComment> selectCommentList(PageInfo cPi, String hostUser) {
	
		return gardenDao.selectCommentList(hostUser, cPi, sqlSession);
	}

	@Override
	public int updateComment(HashMap<String, String> map) {
		
		int result =  gardenDao.updateComment(map, sqlSession);
		if(result < 0) {
			throw new CommException("댓글 수정 실패");
		}
		
		return result;
		
	}

	@Override
	public int deleteComment(String commentNo) {
		int result =  gardenDao.deleteComment(commentNo, sqlSession);
		if(result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
		
	}

	@Override
	public int updateBoard(HashMap<String, String> map) {
		int result =  gardenDao.updateBoard(map, sqlSession);
		if(result < 0) {
			throw new CommException("방명록 수정 실패");
		}
		return result;
		
	}

	@Override
	public int selectPlantListCount(String search) {
		
		return gardenDao.selectPlantListCount(search, sqlSession);
	}

	@Override
	public ArrayList<PlantInfo> selectPlantList(PageInfo pi, String search) {
		
		return gardenDao.selectPlantList(pi, search, sqlSession);
	}

	@Override
	public void insertPlant(PlantInfo info) {
		
		int result =  gardenDao.insertPlant(info, sqlSession);
		if(result < 0) {
			throw new CommException("식물정보 추가 실패");
		} 
		
	}

	@Override
	public void deletePlant(String regNo) {
		int result =  gardenDao.deletePlant(regNo, sqlSession);
		if(result < 0) {
			throw new CommException("식물정보 삭제 실패");
		} 
		
	}

	@Override
	public PlantInfo selectPlantInfo(String regNo) {
		
		return gardenDao.selectPlantInfo(regNo, sqlSession);
	}

	@Override
	public void updatePlantInfo(PlantInfo info) {
		
		int result =  gardenDao.updatePlantInfo(info, sqlSession);
		if(result < 0) {
			throw new CommException("식물정보 삭제 실패");
		} 
		
	}

	@Override
	public int selectLogCount(String hostUser) {
		
		return gardenDao.selectLogCount(hostUser, sqlSession);
	}

	@Override
	public ArrayList<DailyLog> selectLogList(String hostUser, PageInfo pi) {
		
		return gardenDao.selectLogList(hostUser, pi, sqlSession);
	}

	@Override
	public DailyLog selectLog(String logNo) {
		
		return gardenDao.selectLog(logNo, sqlSession);
	}

	@Override
	public void insertDailyLog(DailyLog log) {
		
		int result =  gardenDao.insertDailyLog(log, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 작성 실패");
		} 
	}

	@Override
	public int selectLogCommentCount(String logNo) {
		
		return gardenDao.selectLogCommentCount(logNo, sqlSession);
	}

	@Override
	public ArrayList<DailyLogComment> selectLogCommentList(String logNo) {
		
		return gardenDao.selectLogCommentList(logNo, sqlSession);
	}

	@Override
	public void updateDailylog(DailyLog log) {
		
		int result =  gardenDao.updateDailylog(log, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 수정 실패");
		} 
	}

	@Override
	public void deleteDailyLog(String logNo) {
		
		int result =  gardenDao.deleteDailyLog(logNo, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 삭제 실패");
		} 
	}

	@Override
	public int insertLogComment(DailyLogComment comment) {
		
		int result =  gardenDao.insertLogComment(comment, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 댓글 작성 실패");
		}
		return result; 
	}

	@Override
	public int insertLogReComment(DailyLogComment comment) {
		int result =  gardenDao.insertLogReComment(comment, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 답글 작성 실패");
		}
		return result; 
	}

	@Override
	public int deleteLogComment(String commentNo) {
		
		int result =  gardenDao.deleteLogComment(commentNo, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 댓글 삭제 실패");
		}
		return result; 
	}

	@Override
	public int updateLogComment(DailyLogComment comment) {
		int result =  gardenDao.updateLogComment(comment, sqlSession);
		if(result < 0) {
			throw new CommException("데일리로그 댓글 수정 실패");
		}
		return result; 
	}

	@Override
	public ArrayList<DailyLog> selectRecentLog(String hostUser) {
		
		return gardenDao.selectRecentLog(hostUser, sqlSession);
	}

	@Override
	public int selectMyPlantCount(String hostUser) {
		
		return gardenDao.selectMyPlantCount(hostUser, sqlSession);
	}

	@Override
	public ArrayList<MyPlant> selectMyPlantList(String hostUser, PageInfo pi) {
		
		return gardenDao.selectMyPlantList(hostUser, pi, sqlSession);
	}

	@Override
	public void insertMyPlant(MyPlant myPlant) {
		int result =  gardenDao.insertMyPlant(myPlant, sqlSession);
		if(result < 0) {
			throw new CommException("내 식물 등록 실패");
		}
		
	}

	@Override
	public MyPlant selectMyPlant(String plantNo) {
		
		return gardenDao.selectMyPlant(plantNo, sqlSession);
	}

	@Override
	public int selectGrowListCount(String plantNo) {
		
		return gardenDao.selectGrowListCount(plantNo, sqlSession);
	}

	@Override
	public ArrayList<PlantGrow> selectGrowList(String plantNo) {
		
		return gardenDao.selectGrowList(plantNo, sqlSession);
	}

	@Override
	public int deleteGrowList(String listNo) {
		
		return gardenDao.deleteGrowList(listNo, sqlSession);
	}

	@Override
	public void updateMyPlant(MyPlant plant) {

		int result =  gardenDao.updateMyPlant(plant, sqlSession);
		if(result < 0) {
			throw new CommException("내 식물 수정 실패");
		}
		
	}

	@Override
	public int deleteMyPlant(String plantNo) {
		int result =  gardenDao.deleteMyPlant(plantNo, sqlSession);
		if(result < 0) {
			throw new CommException("내 식물 삭제 실패");
		}
		return result;
		
	}

	@Override
	public List<PlantGrow> selectCalendar(String hostUser) {
		
		return gardenDao.selectCalendar(hostUser, sqlSession);
	}

	@Override
	public void insertPlantGrow(PlantGrow plant) {
		
		int result =  gardenDao.insertPlantGrow(plant, sqlSession);
		if(result < 0) {
			throw new CommException("내 식물 관리내역 등록 실패");
		}
		
	}

	@Override
	public PlantGrow selectPlantGrow(String listNo) {
		
		return gardenDao.selectPlantGrow(listNo, sqlSession);
	}

	@Override
	public void updatePlantGrow(PlantGrow plant) {
		
		int result =  gardenDao.updatePlantGrow(plant, sqlSession);
		if(result < 0) {
			throw new CommException("내 식물 관리내역 수정 실패");
		}
		
	}

	@Override
	public ArrayList<VisitorComment> getCommentList(String hostUser) {
		
		return gardenDao.getCommentList(hostUser, sqlSession);
	}

	@Override
	public ArrayList<PlantGrow> selectPlantGrowAlert(String userNo) {

		return gardenDao.selectPlantGrowAlert(userNo, sqlSession);
	}

	@Override
	public int checkNeighbor(HashMap<String, String> map) {
		
		return gardenDao.checkNeighbor(map, sqlSession);
	}

	@Override
	public int checkMemberId(String nUserId) {
		
		return gardenDao.checkMemberId(nUserId, sqlSession);
	}

	

	

	
}
