package com.uni.spring.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.help.model.dto.Faq;
import com.uni.spring.help.model.dto.PageInfo;

@Repository
public class HelpDao {

	// 자주묻는질문 게시물 갯수 구하기 - 페이징처리
	public static int selectFaqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("helpMapper.selectFaqListCount");
	}

	// 자주묻는질문 게시물 가져오기 
	public static ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectFaqList", null, rowBounds);
	}

}
