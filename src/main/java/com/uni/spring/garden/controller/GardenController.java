package com.uni.spring.garden.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.uni.spring.board.model.dto.Board;
import com.uni.spring.common.exception.CommException;
import com.uni.spring.garden.GardenPagination;
import com.uni.spring.garden.model.dto.DailyLog;
import com.uni.spring.garden.model.dto.DailyLogComment;
import com.uni.spring.garden.model.dto.MyPlant;
import com.uni.spring.garden.model.dto.Neighbor;
import com.uni.spring.garden.model.dto.PageInfo;
import com.uni.spring.garden.model.dto.PlantGrow;
import com.uni.spring.garden.model.dto.PlantInfo;
import com.uni.spring.garden.model.dto.VisitorBoard;
import com.uni.spring.garden.model.service.GardenService;
import com.uni.spring.member.model.dto.Member;

@SessionAttributes("msg")
@Controller
public class GardenController {

	@Autowired
	public GardenService gardenService;
	
	
	@RequestMapping("gardenMain.do")
		public String toMain(@RequestParam(value="hostUser", required=false)String hostUser, HttpSession session, Model model) {
		
		System.out.println("hostUser 널 체크 전 확인" + hostUser);
		
		//방명록 주인 회원번호
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
		}
		//호스트 유저 값은 다른 곳에서도 쓰이니까 세션에 값을 저장
		session.setAttribute("hostUser", hostUser);
		
		System.out.println("hostUser확인" + hostUser);
				
		
		//방문한 페이지의 방명록 3개 가져오기
		ArrayList<VisitorBoard> list = gardenService.getBoardList(hostUser);
		
		model.addAttribute("board", list);
		
		return "garden/gardenMain";
	}
	
	@RequestMapping("visitorBoard.do")
	public String visitorBoardList(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, Model model, HttpSession session){
			//@RequestParam(value="currentPage") int currentPage --> 값이 넘어오지 않아서 에러가 발생
			
			//@RequestParam(value="currentPage" , required=false) int currentPage --> 
			//required : 해당 파라미터가 필수인지 여부를 나타냄 (true:필수)
			//required=false : 값이 필수가 아니다. 그래서 null이 들어올 수 있는데 null은 기본형 int에 들어갈 수 없어서 에러가 발생
			
			//@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage -->
			//defaultValue : 넘어오는 값이 null인 경우에 해당 파라미터 기본 값을 지정함
			
			//방명록 주인 회원번호
			//String hostUser = ((Member) session.getAttribute("loginUser")).getUserNo();
			String hostUser = (String) session.getAttribute("hostUser");
			
			System.out.println("hostUser 널 체크 전 " + hostUser);
			
			if(hostUser == null) {
				hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
				session.setAttribute("hostUser", hostUser);
			}
			
			System.out.println("hostUser 널 체크 후 " + hostUser);
			
			int listCount = gardenService.selectListCount(hostUser);

			//PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit)
			PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 5);
			
			//hostUser의 게시물 가져오기
			ArrayList<Board> list = gardenService.selectList(pi, hostUser);
			
			//hostUser 게시물에 달린 댓글 가져오기
			int commentCount = gardenService.selectCommentCount(hostUser);
			
			System.out.println("commentCount 확인 " + commentCount);
			
			PageInfo cPi = GardenPagination.getPageInfo(commentCount, currentPage, 10, 5);
			
			ArrayList<Board> comment = gardenService.selectCommentList(cPi, hostUser);
			
			System.out.println("comment리스트 확인 " + comment);
			 
			model.addAttribute("board", list);
			model.addAttribute("pi", pi);
			model.addAttribute("comment", comment);

			return "garden/visitorBoardList";
		}

	@RequestMapping("vBoardEnroll.do")
	public String boardEnroll(HttpSession session, String content, String writer, Model model) {
		
		System.out.println("content" + content);
		System.out.println("writer" + writer);
		//String hostUser = ((Member) session.getAttribute("loginUser")).getUserNo();
		String hostUser = (String) session.getAttribute("hostUser");
		
		Map map = new HashMap<String, String>();
		map.put("content", content);
		map.put("writer", writer);
		map.put("hostUser", hostUser);
		
		gardenService.insertBoard(map);

		return "redirect:visitorBoard.do";
		
	}
	
	@RequestMapping("deleteVBoard.do")
	public String boardDelete(String boardNo, Model model) {
		
		gardenService.deleteBoard(boardNo);
		model.addAttribute("msg", "방명록을 삭제했습니다.");

		return "redirect:visitorBoard.do";
		
	}
	
	
	@RequestMapping("updateVBoard.do")
	public String updateBoard(String boardNo, String content, Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", boardNo);
		map.put("content", content);
		
		gardenService.updateBoard(map);
		model.addAttribute("msg", "방명록을 수정했습니다.");

		return "redirect:visitorBoard.do";
		
	}

	//=========================================================================================
	//댓글
	@RequestMapping("insertComment.do")
	public String insertComment(String content, String boardNo, HttpSession session) {
		
		System.out.println("content확인" + content);
		System.out.println("boardNo확인" + boardNo);
		
		//작성자 회원번호 세션에서 가져오기
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		map.put("content", content);
		
		gardenService.insertComment(map);
		
		return "redirect:visitorBoard.do";
	}
	
	
	@RequestMapping("updateComment.do")
	public String updateComment(String commentNo, String content, Model model) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("commentNo", commentNo);
		map.put("content", content);
		
		gardenService.updateComment(map);
		model.addAttribute("msg", "댓글을 수정했습니다.");
		
		return "redirect:visitorBoard.do";
	}
	
	@RequestMapping("deleteComment.do")
	public String deleteComment(String commentNo, Model model) {
		
		gardenService.deleteComment(commentNo);
		model.addAttribute("msg", "댓글을 삭제했습니다.");
		
		return "redirect:visitorBoard.do";		
	}
	
	//=========================================================================================
	//이웃관리
	@RequestMapping("neighborList.do")
	public String neighborList(HttpSession session, Model model) {
		
		//로그인한 회원 번호
		String userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<Neighbor> list = gardenService.getNeighborList(userNo);
		
		model.addAttribute("list", list);
		
		System.out.println("list확인 " + list);
		
		return "garden/neighborList";	
	}
	
	@RequestMapping("deleteNeighbor.do")
	public String deleteNeighbor(String neighborNo) {
		
		gardenService.deleteNeighbor(neighborNo);
		
		return "redirect:neighborList.do";			
	}
	
	@RequestMapping("insertNeighbor.do")
	public String insertNeighbor(String nUserId, String userNo) {
		
		System.out.println("nUserId" + nUserId);
		System.out.println("userNo" + userNo);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nUserId", nUserId); //추가하고 싶은 이웃의 아이디
		map.put("userNo", userNo); //로그인한 회원 번호		
		
		gardenService.insertNeighbor(map);
		return "redirect:neighborList.do";
	}
	
	//=========================================================================================
	//식물등록 관리자페이지로 이동
	@RequestMapping("adminPlant.do")
	public String adminPlant(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, 
							@RequestParam(value="search" , required=false) String search,
							Model model){
		
		int listCount = gardenService.selectPlantListCount(search);
		
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<PlantInfo> list = gardenService.selectPlantList(pi, search);
		
		System.out.println("list확인 " + list);
		model.addAttribute("info", list);
		model.addAttribute("pi", pi);
	
		return "garden/adminPlant";
	}
	
	@RequestMapping("insertPlantForm.do")
	public String insertPlantForm() {
		return "garden/adminInsertPlantForm";
	}
	
	@RequestMapping("insertPlant.do")
	public String insertPlant(Model model, PlantInfo info) {
		
		gardenService.insertPlant(info);
		model.addAttribute("msg", "식물정보를 추가했습니다.");
		
		
		return "redirect:adminPlant.do";
	}
	
	@RequestMapping("deletePlant.do")
	public String deletePlant(Model model, String regNo) {
		
		gardenService.deletePlant(regNo);
		model.addAttribute("msg", "식물정보를 삭제했습니다.");
		return "redirect:adminPlant.do";
	}
	
	@RequestMapping("updatePlantForm.do")
	public String updatePlant(String regNo, Model model) {
		
		PlantInfo info = gardenService.selectPlantInfo(regNo);
		System.out.println("info 확인 " + info);
		model.addAttribute("info", info);
		
		return "garden/adminUpdatePlantForm";
	}
	
	@RequestMapping("updatePlantInfo.do")
	public String updatePlantInfo(Model model, PlantInfo info) {
		
		gardenService.updatePlantInfo(info);
		model.addAttribute("msg", "식물정보를 수정했습니다.");
		return "redirect:adminPlant.do";
	}
	
	//=========================================================================================
	//데일리로그
	@RequestMapping("dailyLog.do")
	public String dailyLog(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
							Model model, HttpSession session) {
		
		String hostUser = (String) session.getAttribute("hostUser");
		
		System.out.println("hostUser 널 체크 전 " + hostUser);
		
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
			session.setAttribute("hostUser", hostUser);
		}
		
		System.out.println("hostUser 널 체크 후 " + hostUser);
		
		//페이징
		int listCount = gardenService.selectLogCount(hostUser);
		
		System.out.println("listCount확인" + listCount);
		
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<DailyLog> dailyLog = gardenService.selectLogList(hostUser, pi);
		
		System.out.println("list확인 " +  dailyLog);
		
		model.addAttribute("dailyLog", dailyLog);
		model.addAttribute("pi", pi);
		
		return "garden/dailyLog";
	}
	
	@RequestMapping("logDetail.do")
	public String selectLog(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
							String logNo, Model model, HttpSession session) {
		
		System.out.println("logNo확인" + logNo);
		
		DailyLog log = gardenService.selectLog(logNo);
		
//		int commentCount = gardenService.selectLogCommentCount(logNo);
//		
//		PageInfo pi = GardenPagination.getPageInfo(commentCount, currentPage, 10, 10);
//		
//		ArrayList<DailyLogComment> comment = gardenService.selectLogCommentList(pi, logNo);
//		
//		System.out.println("comment 확인" + comment);
		
		model.addAttribute("log", log);
//		model.addAttribute("comment", comment);
//		model.addAttribute("pi", pi);
		
		String hostUser = (String) session.getAttribute("hostUser");
		System.out.println("hostUser확인" + hostUser);
		
		ArrayList<DailyLog> list = gardenService.selectRecentLog(hostUser);
		model.addAttribute("list", list);
		
		return "garden/dailyLogDetailView";
	}
	
	@RequestMapping("insertLogForm.do")
	public String insertLogForm() {
		return "garden/dailyLogInsertForm";
	}
	
	@RequestMapping("insertDailyLog.do")
	public String insertDailyLog(@RequestParam(name = "upfile", required=false)MultipartFile file, DailyLog log, HttpServletRequest request) {
		
		System.out.println("log 확인 " + log);
		
		//파일첨부하지 않으면 빈 문자열이 넘어옴
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file,request);
			
			if(changeName != null) {
				log.setFileName(file.getOriginalFilename());
				log.setServerName(changeName);
			}
		}
		
		System.out.println("log 확인 " + log);
		gardenService.insertDailyLog(log);
			
		return "redirect:dailyLog.do";
	}
	
	@RequestMapping("updateDailyLogForm.do")
	public String updateDailyLogForm(String logNo, Model model) {
		
		DailyLog log = gardenService.selectLog(logNo);
		model.addAttribute("log", log);
	
		return "garden/dailyLogUpdateForm";
	}
	
	@RequestMapping("updateDailyLog.do")
	public String updateDailyLog(@RequestParam(name = "upfile", required=false)MultipartFile file, DailyLog log, HttpServletRequest request, Model model) {
		
		String orgChangeName = log.getServerName();
		if(!file.getOriginalFilename().equals("")) {//새로 넘어온 파일이 있는 경우
				
			String changeName = saveFile(file, request);
			
			log.setFileName(file.getOriginalFilename());
			log.setServerName(changeName);
			
			if(orgChangeName != null) {//기존 파일도 있는 경우 --> 서버에 업로드된 기존 파일 삭제
				deleteFile(orgChangeName, request);
			}

		}
		
		gardenService.updateDailylog(log);
		
		model.addAttribute("logNo", log.getLogNo());
		model.addAttribute("msg", "데일리로그를 수정했습니다.");
				
		return "redirect:logDetail.do";
	}
	
	@RequestMapping("deleteDailyLog.do")
	public String deleteDailyLog(String logNo, String fileName, HttpServletRequest request, Model model) {
		
		gardenService.deleteDailyLog(logNo);
		
		if(!fileName.equals("")) {
			//첨부된 파일이 있으면 파일도 삭제하기
			deleteFile(fileName, request);
		}
		
		model.addAttribute("msg", "데일리로그를 삭제했습니다.");
		
		return "redirect:dailyLog.do";
	}
	

	//=========================================================================================
	//데일리로그 댓글 

	@ResponseBody
	@RequestMapping(value = "selectCommentList.do", produces="application/json; charset=utf-8")
	public ArrayList<DailyLogComment> selectLogCommentList(String logNo) {

		//int commentCount = gardenService.selectLogCommentCount(logNo);
		
		//PageInfo pi = GardenPagination.getPageInfo(commentCount, currentPage, 10, 10);
		
		ArrayList<DailyLogComment> comment = gardenService.selectLogCommentList(logNo);
		
		System.out.println("comment 확인" + comment);
				
		return comment;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "insertLogComment.do", produces="application/json; charset=utf-8")
	public int insertLogComment(DailyLogComment comment) {
		
		int result = gardenService.insertLogComment(comment);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "insertLogReComment.do", produces="application/json; charset=utf-8")
	public int insertLogReComment(DailyLogComment comment) {
		
		int result = gardenService.insertLogReComment(comment);
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "deleteLogComment.do", produces="application/json; charset=utf-8")
	public int deleteLogComment(String commentNo) {
		return gardenService.deleteLogComment(commentNo);
	}
	
	@ResponseBody
	@RequestMapping(value = "updateLogComment.do", produces="application/json; charset=utf-8")
	public int updateLogComment(DailyLogComment comment) {
		return gardenService.updateLogComment(comment);
	}
	
	//=========================================================================================
	//식물관리 캘린더 기능
	@RequestMapping("myPlant.do")
	public String myPlantMain(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
								HttpSession session, Model model) {
		String hostUser = (String) session.getAttribute("hostUser");
		
		System.out.println("hostUser 널 체크 전 " + hostUser);
		
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
			session.setAttribute("hostUser", hostUser);
		}
		
		System.out.println("hostUser 널 체크 후 " + hostUser);
		
		int myPlantCount = gardenService.selectMyPlantCount(hostUser);
		
		PageInfo pi = GardenPagination.getPageInfo(myPlantCount, currentPage, 10, 5);
		
		ArrayList<MyPlant> myPlant = gardenService.selectMyPlantList(hostUser, pi);
		System.out.println("myPlant 확인 : " + myPlant);
		
		model.addAttribute("myPlant", myPlant);
		model.addAttribute("pi", pi);

		return "garden/myPlantMain";
	}
	
	@RequestMapping("insertMyPlantForm.do")
	public String insertMyPlantForm(Model model) {
		
		//같은 메소드 사용위해 임의로 넣는 값
		PageInfo pi = GardenPagination.getPageInfo(100, 1, 10, 10);
		String search = null;
		
		ArrayList<PlantInfo> info = gardenService.selectPlantList(pi, search);
 		
		System.out.println("info확인 " + info);
		
		model.addAttribute("info", info);
		
		return "garden/myPlantInsertForm";
	}
	
	
	@RequestMapping("insertMyPlant.do")
	public String insertMyPlant(@RequestParam(name = "upfile", required=false)MultipartFile file, 
								MyPlant myPlant, HttpServletRequest request) {
		
		System.out.println("myPlant 확인 " + myPlant);
		
		//파일첨부하지 않으면 빈 문자열이 넘어옴
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file,request);
			
			if(changeName != null) {
				myPlant.setFileName(file.getOriginalFilename());
				myPlant.setServerName(changeName);
			}
		}
		
		System.out.println("myPlant 확인 " + myPlant);
		gardenService.insertMyPlant(myPlant);
			
		return "redirect:myPlant.do";
	}

	@ResponseBody
	@RequestMapping(value = "selectPlantInfo.do", produces="application/json; charset=utf-8")
	public PlantInfo selectPlantInfo(String regNo) {
		
		PlantInfo info = gardenService.selectPlantInfo(regNo);
		return info;
	}
	
	@RequestMapping("myPlantDetail.do")
	public String myPlantDetail(String plantNo, Model model) {
		
		MyPlant plant = gardenService.selectMyPlant(plantNo);
		System.out.println("plant확인" + plant);
		model.addAttribute("plant", plant);
		
		return "garden/myPlantDetailView";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectGrowList.do", produces="application/json; charset=utf-8")
	public String selectGrowList(String plantNo){
		
		ArrayList<PlantGrow> growList = gardenService.selectGrowList(plantNo);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(growList);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "deleteGrowList.do", produces="application/json; charset=utf-8")
	public int deleteGrowList(String listNo) {
		
		int result = gardenService.deleteGrowList(listNo);
		
		return result;
	}
	
	@RequestMapping("updateMyPlantForm.do")
	public String updateMyPlantForm(String plantNo, Model model) {
		
		MyPlant plant = gardenService.selectMyPlant(plantNo);
		model.addAttribute("plant", plant);
		
		return "garden/myPlantUpdateForm";
		
	}
	
	@RequestMapping("updateMyPlant.do")
	public String updateMyPlant(@RequestParam(name = "upfile", required=false)MultipartFile file, 
								MyPlant plant, HttpServletRequest request, Model model) {
		
		String orgChangeName = plant.getServerName();
		if(!file.getOriginalFilename().equals("")) {//새로 넘어온 파일이 있는 경우
				
			String changeName = saveFile(file, request);
			
			plant.setFileName(file.getOriginalFilename());
			plant.setServerName(changeName);
			
			if(orgChangeName != null) {//기존 파일도 있는 경우 --> 서버에 업로드된 기존 파일 삭제
				deleteFile(orgChangeName, request);
			}
		}
		
		gardenService.updateMyPlant(plant);
		
		model.addAttribute("plantNo", plant.getPlantNo());
		
		return "redirect:myPlantDetail.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteMyPlant.do", produces="application/json; charset=utf-8")
	public int deleteMyPlant(String plantNo, String fileName, HttpServletRequest request) {
		
		int result = gardenService.deleteMyPlant(plantNo);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		
		return result;
	}
	//=========================================================================================
	//파일관련
	//전달받은 파일을 업로드시키고 수정된 파일명을 리턴하는 기능
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		//경로찾기 . 웹컨테이너에서의 resources 폴더 경로 추출
		String resources = request.getSession().getServletContext().getRealPath("resources");
		System.out.println(resources);
		
		String savePath = resources + "\\garden_upload_files\\";
		System.out.println("savePath 확인 " + savePath);
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 년월일시분초 가져온다
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// 파일 업로드 실패했을 때
			e.printStackTrace();
			throw new CommException("File Upload Error");
		}
		
		return changeName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = resources + "\\upload_files\\";
		
		//경로의 파일을 가리킴
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}
}

