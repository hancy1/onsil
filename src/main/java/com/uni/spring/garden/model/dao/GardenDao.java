package com.uni.spring.garden.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.garden.model.dto.VisitorBoard;

@Repository
public class GardenDao {

	public ArrayList<VisitorBoard> getBoardList(String hostUser, SqlSessionTemplate sqlSession) {
		
		ArrayList<VisitorBoard> list = (ArrayList)sqlSession.selectList("gardenMapper.getBoardList", hostUser);
			
		System.out.println("다오 list " + list);
		
		return list;
	}

}
