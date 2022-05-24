package com.uni.spring.garden.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.garden.model.dto.VisitorBoard;

@Repository
public class GardenDao {

	public ArrayList<VisitorBoard> getBoardList(String userNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.getBoardList", userNo);
	}

}
