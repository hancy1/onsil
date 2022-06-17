package com.uni.spring.ticket.model.dto;

import java.sql.Date;

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
public class TPrice {

   private String TCode;//티켓코드
   private String division;//카테고리명
   private int price;//가격
   
}
