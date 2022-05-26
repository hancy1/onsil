package com.uni.spring.garden.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;

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
	public ArrayList<Board> getBoardList(String hostUser, PageInfo pi, SqlSessionTemplate sqlSession) {
		
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

	public ArrayList<Neighbor> getNeighborList(String userNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("gardenMapper.getNeighborList", userNo);

	}

	public int deleteNeighbor(String neighborNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.update("gardenMapper.deleteNeighbor", neighborNo);
	}

	public int insertNeighbor(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("gardenMapper.insertNeighbor", map);		
	}

}
