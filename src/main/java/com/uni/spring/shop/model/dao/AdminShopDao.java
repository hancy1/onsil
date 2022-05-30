package com.uni.spring.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Repository
public class AdminShopDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminShopMapper.selectListCount");
	}

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectList", null, rowdounds);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("adminShopMapper.insertProduct",p);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession, String proCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.selectProduct",proCode);
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, String proCode) {
		// TODO Auto-generated method stub
		System.out.println("다오 proCode넘어오는지?"+proCode);
		return sqlSession.update("adminShopMapper.deleteProduct",proCode);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminShopMapper.updateProduct",p);
	}



}
