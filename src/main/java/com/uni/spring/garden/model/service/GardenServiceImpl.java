package com.uni.spring.garden.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.garden.model.dao.GardenDao;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;



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
	public ArrayList<Board> selectList(PageInfo pi, String hostUser) {
		
		return gardenDao.getBoardList(hostUser, pi, sqlSession);
	}

	@Override
	public void insertBoard(Map map) {
		
		int result = gardenDao.insertBoard(map, sqlSession);
		
		if(result < 0) {
			throw new CommException("방명록 작성 실패");
		}
		
	}

	@Override
	public void deleteBoard(String boardNo) {
		int result = gardenDao.deleteBoard(boardNo, sqlSession);	
		
		if(result < 0) {
			throw new CommException("방명록 삭제 실패");
		}
		
	}

	@Override
	public ArrayList<Neighbor> getNeighborList(String userNo) {
		
		return gardenDao.getNeighborList(userNo, sqlSession);
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

	

	

	
}
