package com.uni.spring.garden.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlantInfo {
	
	private String regNo;
	private String category;
	private String plantName;
	private String water;
	private String sun;
	private String status;
	
}
