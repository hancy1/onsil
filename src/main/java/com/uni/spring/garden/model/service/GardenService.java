package com.uni.spring.garden.model.service;

import java.util.ArrayList;

import com.uni.spring.garden.model.dto.VisitorBoard;

public interface GardenService {

	ArrayList<VisitorBoard> getBoardList(String userNo);

}
