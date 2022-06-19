package com.uni.spring.shop.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.spring.shop.model.dto.Cart;
import com.uni.spring.shop.model.dto.Freebie;
import com.uni.spring.shop.model.dto.Point;
import com.uni.spring.shop.model.dto.PointInfo;
import com.uni.spring.shop.model.dto.ProOrder;
import com.uni.spring.shop.model.dto.ProReview;
import com.uni.spring.shop.model.dto.Product;
import com.uni.spring.shop.model.dto.ReviewLike;
import com.uni.spring.shop.model.dto.ShopPageInfo;

@Repository
public class ShopDao {

	public ArrayList<Point> selectMyPoint(SqlSessionTemplate sqlSession, String userNo1) {
		
		int userNo = Integer.parseInt(userNo1);
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectMyPoint",userNo);
	}

	public PointInfo selectPointTotal(SqlSessionTemplate sqlSession, String userNo1) {
		
		int userNo = Integer.parseInt(userNo1);
		return sqlSession.selectOne("shopMapper.selectPointTotal",userNo);
	}

	public int myReviewListCount(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.myReviewListCount",userNo);
	}

	public ArrayList<ProReview> selectMyReviewList(SqlSessionTemplate sqlSession, ShopPageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectMyReviewList", userNo, rowdounds);
	}

	public int increaseCountReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.increaseCountReview",reviewNo);
	}

	public ProReview selectReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectReview",reviewNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, ProReview r) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateReview",r);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.deleteReview",reviewNo);
	}

	public int productListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productListCount");
	}

	public ArrayList<Product> selectShopList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopList", null, rowdounds);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartList",userNo);
	}

	public ArrayList<ProOrder> selectOrderList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrderList",userNo);
	}

	public ArrayList<ProOrder> selectOrderCancelList(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectOrderCancelList",userNo);
	}
	
	public int deleteCart(SqlSessionTemplate sqlSession, int cartNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("shopMapper.deleteCart",cartNo);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Map cartMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertCart", cartMap);
	}

	public int cancelRequestOrder(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.cancelRequestOrder",orderNo);
	}

	public int OkOrder(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.OkOrder",orderNo);
	}

	public String selectProductCode(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectProductCode",orderNo);
	}

	public int insertReview(SqlSessionTemplate sqlSession, ProReview r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertReview", r);
	}

	public int insertPoint(SqlSessionTemplate sqlSession, Point p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertPoint", p);
	}

	public int updateOTableReviewOk(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.updateOTableReviewOk",orderNo);
	}

	public ProOrder selectOrder(SqlSessionTemplate sqlSession, int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectOrder",orderNo);
	}

	public ArrayList<Product> selectShopTreeList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopTreeList", null, rowdounds);
	}

	public ArrayList<Product> selectShopEdibleList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopEdibleList", null, rowdounds);
	}

	public ArrayList<Product> selectShopFlowerList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopFlowerList", null, rowdounds);
	}

	public ArrayList<Product> selectShopEctList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectShopEctList", null, rowdounds);
	}

	public int productEctListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productEctListCount");
	}

	public int productFlowerListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productFlowerListCount");
	}

	public int productEdibleListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productEdibleListCount");
	}

	public int productTreeListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.productTreeListCount");
	}

	public Product selectShop(SqlSessionTemplate sqlSession, String proCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectShop",proCode);
	}

	public ArrayList<ProReview> selectProReviewList(SqlSessionTemplate sqlSession, String proCode) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectProReviewList", proCode);
	}

	public int proReviewListCount(SqlSessionTemplate sqlSession, String proCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.proReviewListCount", proCode);
	}

	public ArrayList<Freebie> selectFreebieList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("shopMapper.selectFreebieUserList");
	}

	public int insertOrder(SqlSessionTemplate sqlSession, ProOrder o) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertOrder", o);
	}

	public ArrayList<Product> selectBestSeller(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("shopMapper.selectBestSeller");
	}

	public ReviewLike selectLike(SqlSessionTemplate sqlSession, Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectLike", map);
	}

	public ReviewLike findLike(SqlSessionTemplate sqlSession, ReviewLike rLike) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.findLike", rLike);
	}

	public int insertLike(SqlSessionTemplate sqlSession, ReviewLike rLike) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopMapper.insertLike", rLike);
	}

	public void deleteLike(SqlSessionTemplate sqlSession, ReviewLike rLike) {
		// TODO Auto-generated method stub
		sqlSession.delete("shopMapper.deleteHeart",rLike);
	}

	public int likeCount(SqlSessionTemplate sqlSession, int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.likeCount", reviewNo);
	}

	public ArrayList<Product> searchShopList(SqlSessionTemplate sqlSession, ShopPageInfo pi, String searchKeyword) {
		// TODO Auto-generated method stub

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.searchShopList", searchKeyword, rowdounds);
	}

	public Freebie selectFreebie(SqlSessionTemplate sqlSession, int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopMapper.selectFreebie", freeNo);
	}

	public ArrayList<Product> sortPriceList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.sortPriceList", null, rowdounds);
	}

	public ArrayList<Product> sortNameList(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.sortNameList", null, rowdounds);
	}

	public ArrayList<Product> sortPriceListDesc(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.sortPriceListDesc", null, rowdounds);
	}

	public ArrayList<Product> sortNameListDesc(SqlSessionTemplate sqlSession, ShopPageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowdounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("shopMapper.sortNameListDesc", null, rowdounds);
	}

	public int buyFreebie(SqlSessionTemplate sqlSession, int freeNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("shopMapper.buyFreebie",freeNo);
	}







}
