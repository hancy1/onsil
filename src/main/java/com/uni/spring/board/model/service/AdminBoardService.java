package com.uni.spring.board.model.service;

import java.util.ArrayList;

import com.uni.spring.board.model.dto.Board;
import com.uni.spring.board.model.dto.PageInfo;
import com.uni.spring.board.model.dto.Reply;

public interface AdminBoardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	void deleteBoard(int bno);


}
