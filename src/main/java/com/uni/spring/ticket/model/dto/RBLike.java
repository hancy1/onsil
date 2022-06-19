package com.uni.spring.ticket.model.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // 게터,세터 생성자
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RBLike {

	private int rbLikeNo;//좋아요번호
	private int rbNo;//게시글번호
	private int userNo;//회원번호
	private int heart;//좋아요여부
	private String userId;//회원아이디
	
	
}
