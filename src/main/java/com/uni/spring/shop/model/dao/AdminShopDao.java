package com.uni.spring.shop.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.ProStock;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Repository
public class AdminShopDao {

	
	//제품영역
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

	
	
	
	//사은품 영역	
	public int freebieListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.freebieListCount");
	}

	public ArrayList<Freebie> selectFreebieList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectFreebieList", null, rowdounds);
	}

	public int insertFreebie(SqlSessionTemplate sqlSession, Freebie f) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminShopMapper.insertFreebie",f);
	}

	public Freebie selectFreebie(SqlSessionTemplate sqlSession, int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.selectFreebie",freeNo);
	}

	public int deleteFreebie(SqlSessionTemplate sqlSession, int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminShopMapper.deleteFreebie",freeNo);
	}

	public int updateFreebie(SqlSessionTemplate sqlSession, Freebie f) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminShopMapper.updateFreebie",f);
	}

	
	//리뷰영역
	public int reviewListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.reviewListCount");
	}

	public ArrayList<ProReview> selectReviewList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectReviewList", null, rowdounds);
	}

	public int deleteAdminReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("adminShopMapper.deleteAdminReview",reviewNo);
	}

	
	//재고관리영역
	public int inventoryListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.inventoryListCount");
	}

	public ArrayList<ProStock> selectInventoryList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectInventoryList", null, rowdounds);
	}

	public ArrayList<Product> selectpCodeList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectpCodeList");
	}

	public int insertInventory(SqlSessionTemplate sqlSession, ProStock stock) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminShopMapper.insertInventory",stock);
	}

	public int orderListCountAll(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.orderListCountAll");
	}

	
	public ArrayList<ProOrder> selectOrderList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectOrderList", null, rowdounds);
	}

	
	public int orderListCountRequest(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.orderListCountRequest");
	}

	
	
	public ArrayList<ProOrder> selectOrderRequestList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectOrderRequestList", null, rowdounds);
	}
	
	
	
	public int orderListCountCancel(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminShopMapper.orderListCountCancel");
	}



	public ArrayList<ProOrder> selectOrderCancelList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminShopMapper.selectOrderCancelList", null, rowdounds);
	}





	
	
}
