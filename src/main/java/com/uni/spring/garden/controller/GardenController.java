package com.uni.spring.garden.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
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
import com.uni.spring.garden.model.dto.VisitorComment;
import com.uni.spring.garden.model.service.GardenService;
import com.uni.spring.member.model.dto.Member;

@SessionAttributes("msg")
@Controller
public class GardenController {

	@Autowired
	public GardenService gardenService;
	
	@RequestMapping("growAlert.do")
	public String growAlert(Model model, HttpSession session) {
		
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		ArrayList<PlantGrow> list = gardenService.selectPlantGrowAlert(userNo);
		
		model.addAttribute("list",list);
		
		return "garden/growAlert";
	}
	
	@RequestMapping("gardenMain.do")
		public String toMain(@RequestParam(value="hostUser", required=false)String hostUser, HttpSession session, Model model) {
		
		//????????? ?????? ????????????
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
		}
		//????????? ?????? ?????? ?????? ???????????? ???????????? ????????? ?????? ??????
		session.setAttribute("hostUser", hostUser);
		System.out.println("????????? ?????? hostUser ?????? " + session.getAttribute("hostUser"));
		
		System.out.println("hostUser??????" + hostUser);
				
		//????????? ???????????? ????????? 3??? ????????????
		ArrayList<VisitorBoard> board = gardenService.getBoardList(hostUser);
		
		//???????????? ?????? ????????????
		ArrayList<VisitorComment> comment = gardenService.getCommentList(hostUser);
		
		//?????? ????????? ???????????? ????????? ?????? ???
		PageInfo pi = GardenPagination.getPageInfo(100, 1, 10, 10);
		ArrayList<MyPlant> plant = gardenService.selectMyPlantList(hostUser, pi);
		
		//??????????????? ????????????
		ArrayList<DailyLog> log = gardenService.selectRecentLog(hostUser);
		
		model.addAttribute("board", board);
		model.addAttribute("comment", comment);
		model.addAttribute("plant", plant);
		model.addAttribute("log", log);
		
		return "garden/gardenMain";
	}
	
	@RequestMapping("visitorBoard.do")
	public String visitorBoardList(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, Model model, HttpSession session){
			/*@RequestParam(value="currentPage") int currentPage --> ?????? ???????????? ????????? ????????? ??????
			
			@RequestParam(value="currentPage" , required=false) int currentPage --> 
			required : ?????? ??????????????? ???????????? ????????? ????????? (true:??????)
			required=false : ?????? ????????? ?????????. ????????? null??? ????????? ??? ????????? null??? ????????? int??? ????????? ??? ????????? ????????? ??????
			
			@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage -->
			defaultValue : ???????????? ?????? null??? ????????? ?????? ???????????? ?????? ?????? ?????????*/
			
			//????????? ?????? ????????????
			String hostUser = (String) session.getAttribute("hostUser");
			
			System.out.println("hostUser ??? ?????? ??? " + hostUser);
			
			if(hostUser == null) {
				hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
				session.setAttribute("hostUser", hostUser);
			}
			
			System.out.println("hostUser ??? ?????? ??? " + hostUser);
			
			int listCount = gardenService.selectListCount(hostUser);

			//PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit)
			PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 5);
			
			//hostUser??? ????????? ????????????
			ArrayList<VisitorBoard> list = gardenService.selectList(pi, hostUser);
			
			//hostUser ???????????? ?????? ?????? ????????????
			int commentCount = gardenService.selectCommentCount(hostUser);
			
			PageInfo cPi = GardenPagination.getPageInfo(commentCount, currentPage, 10, 5);
			
			ArrayList<VisitorComment> comment = gardenService.selectCommentList(cPi, hostUser);
			 
			model.addAttribute("board", list);
			model.addAttribute("pi", pi);
			model.addAttribute("comment", comment);

			return "garden/visitorBoardList";
		}
	
	@ResponseBody
	@RequestMapping(value="selectVBoard.do", produces="application/json; charset=utf-8")
	public Map<String, Object> selectVBoard(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, 
											String hostUser, Model model) {
		
		int listCount = gardenService.selectListCount(hostUser);

		//PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit)
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 5);
		
		//hostUser??? ????????? ????????????
		ArrayList<VisitorBoard> list = gardenService.selectList(pi, hostUser);
		
		//hostUser??? ?????? ????????????
		ArrayList<VisitorComment> comment = gardenService.selectCommentList(pi, hostUser);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("list", list);
		map.put("comment", comment);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("vBoardEnroll.do")
	public int boardEnroll(HttpSession session, String content, String writer) {

		String hostUser = (String) session.getAttribute("hostUser");
		
		Map map = new HashMap<String, String>();
		map.put("content", content);
		map.put("writer", writer);
		map.put("hostUser", hostUser);
		
		int result = gardenService.insertBoard(map);

		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteVBoard.do", produces="application/json; charset=utf-8")
	public int boardDelete(String boardNo, RedirectAttributes reAttr) {
		
		int result = gardenService.deleteBoard(boardNo);
		

		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("updateVBoard.do")
	public int updateBoard(String boardNo, String content) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardNo", boardNo);
		map.put("content", content);
		
		int result = gardenService.updateBoard(map);

		return result;
		
	}

	//=========================================================================================
	//????????? ??????
	@ResponseBody
	@RequestMapping("insertComment.do")
	public int insertComment(String content, String boardNo, HttpSession session) {
		
		//????????? ???????????? ???????????? ????????????
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("boardNo", boardNo);
		map.put("content", content);
		
		int result = gardenService.insertComment(map);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("updateComment.do")
	public int updateComment(String commentNo, String content) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("commentNo", commentNo);
		map.put("content", content);
		
		int result = gardenService.updateComment(map);
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("deleteComment.do")
	public int deleteComment(String commentNo) {
		
		int result = gardenService.deleteComment(commentNo);
		
		return result;	
	}
	
	//=========================================================================================
	//????????????
	@RequestMapping("neighborList.do")
	public String neighborList(HttpSession session, Model model) {
		
		String hostUser = (String) session.getAttribute("hostUser");
		
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
			session.setAttribute("hostUser", hostUser);
		}
		
		ArrayList<Neighbor> list = gardenService.getNeighborList(hostUser);
		
		model.addAttribute("list", list);
		
		return "garden/neighborList";	
	}
	
	@RequestMapping("deleteNeighbor.do")
	public String deleteNeighbor(String neighborNo, RedirectAttributes reAttr) {
		
		gardenService.deleteNeighbor(neighborNo);
		reAttr.addFlashAttribute("msg", "????????? ??????????????????.");
		
		return "redirect:neighborList.do";			
	}
	
	@ResponseBody
	@RequestMapping(value = "checkNeighbor.do", produces="application/json; charset=utf-8")
	public int checkNeighbor(String nUserId, String userNo) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nUserId", nUserId);
		map.put("userNo", userNo);
		
		int result = gardenService.checkNeighbor(map);
				
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "checkMemberId.do", produces="application/json; charset=utf-8")
	public int checkMemberId(String nUserId) {
		
		int result = gardenService.checkMemberId(nUserId);
				
		return result;
	}
	
	@RequestMapping("insertNeighbor.do")
	public String insertNeighbor(String nUserId, String userNo, RedirectAttributes reAttr) {

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("nUserId", nUserId); //???????????? ?????? ????????? ?????????
		map.put("userNo", userNo); //???????????? ?????? ??????		
		
		gardenService.insertNeighbor(map);
		reAttr.addFlashAttribute("msg", "????????? ??????????????????.");
		
		return "redirect:neighborList.do";
	}
	
	//=========================================================================================
	//????????? ???????????? ?????????????????? ??????
	@RequestMapping("adminPlant.do")
	public String adminPlant(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage, 
							@RequestParam(value="search" , required=false) String search,
							Model model){
		
		int listCount = gardenService.selectPlantListCount(search);
		
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<PlantInfo> list = gardenService.selectPlantList(pi, search);

		model.addAttribute("info", list);
		model.addAttribute("pi", pi);
	
		return "garden/adminPlant";
	}
	
	@ResponseBody
	@RequestMapping("selectInfoList.do")
	public Map<String, Object> selectInfoList(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
											  @RequestParam(value="search" , required=false) String search) {

		int listCount = gardenService.selectPlantListCount(search);
		
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<PlantInfo> list = gardenService.selectPlantList(pi, search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("info", list);
		
		return map;
	}
	
	@RequestMapping("insertPlantForm.do")
	public String insertPlantForm() {
		return "garden/adminInsertPlantForm";
	}
	
	@RequestMapping("insertPlant.do")
	public String insertPlant(PlantInfo info, RedirectAttributes reAttr) {
		
		gardenService.insertPlant(info);
		reAttr.addFlashAttribute("msg", "??????????????? ??????????????????.");		
		
		return "redirect:adminPlant.do";
	}
	
	@ResponseBody
	@RequestMapping("deletePlant.do")
	public int deletePlant(String regNo) {
		
		int result = gardenService.deletePlant(regNo);

		return result;
	}
	
	@RequestMapping("updatePlantForm.do")
	public String updatePlant(String regNo, Model model) {
		
		PlantInfo info = gardenService.selectPlantInfo(regNo);
		
		model.addAttribute("info", info);
		
		return "garden/adminUpdatePlantForm";
	}
	
	@RequestMapping("updatePlantInfo.do")
	public String updatePlantInfo(PlantInfo info, RedirectAttributes reAttr) {
		
		gardenService.updatePlantInfo(info);
		reAttr.addFlashAttribute("msg", "??????????????? ??????????????????.");
		return "redirect:adminPlant.do";
	}
	
	//=========================================================================================
	//???????????????
	@RequestMapping("dailyLog.do")
	public String dailyLog(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
							Model model, HttpSession session) {
		
		String hostUser = (String) session.getAttribute("hostUser");
		
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
			session.setAttribute("hostUser", hostUser);
		}
		
		//?????????
		int listCount = gardenService.selectLogCount(hostUser);
		
		PageInfo pi = GardenPagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<DailyLog> dailyLog = gardenService.selectLogList(hostUser, pi);
		
		model.addAttribute("dailyLog", dailyLog);
		model.addAttribute("pi", pi);
		
		return "garden/dailyLog";
	}
	
	@RequestMapping("logDetail.do")
	public String selectLog(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
							String logNo, Model model, HttpSession session) {
		
		System.out.println("logNo??????" + logNo);
		
		DailyLog log = gardenService.selectLog(logNo);

		model.addAttribute("log", log);
		
		String hostUser = (String) session.getAttribute("hostUser");
		
		ArrayList<DailyLog> list = gardenService.selectRecentLog(hostUser);
		model.addAttribute("list", list);
		
		return "garden/dailyLogDetailView";
	}
	
	@RequestMapping("insertLogForm.do")
	public String insertLogForm() {
		return "garden/dailyLogInsertForm";
	}
	
	@RequestMapping("insertDailyLog.do")
	public String insertDailyLog(@RequestParam(name = "upfile", required=false)MultipartFile file, DailyLog log, 
								HttpServletRequest request, RedirectAttributes reAttr) {
		
		//?????????????????? ????????? ??? ???????????? ?????????
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file,request);
			
			if(changeName != null) {
				log.setFileName(file.getOriginalFilename());
				log.setServerName(changeName);
			}
		}
		
		gardenService.insertDailyLog(log);
		reAttr.addFlashAttribute("msg", "?????????????????? ??????????????????.");
			
		return "redirect:dailyLog.do";
	}
	
	@RequestMapping("updateDailyLogForm.do")
	public String updateDailyLogForm(String logNo, Model model) {
		
		DailyLog log = gardenService.selectLog(logNo);
		model.addAttribute("log", log);
	
		return "garden/dailyLogUpdateForm";
	}
	
	@RequestMapping("updateDailyLog.do")
	public String updateDailyLog(@RequestParam(name = "upfile", required=false)MultipartFile file, DailyLog log, 
								HttpServletRequest request, Model model, RedirectAttributes reAttr) {
		
		System.out.println("log??????" + log);

		System.out.println("file??????" + file.getOriginalFilename());
		
		String orgChangeName = log.getServerName();
		if(!file.getOriginalFilename().equals("")) {//?????? ????????? ????????? ?????? ??????
			
			System.out.println("??????????????????????????????");
			String changeName = saveFile(file, request);
			
			log.setFileName(file.getOriginalFilename());
			log.setServerName(changeName);
			
			if(orgChangeName != null) {//?????? ????????? ?????? ?????? --> ????????? ???????????? ?????? ?????? ??????
				System.out.println("??? ??????????????? ?????????????????????");
				deleteFile(orgChangeName, request);
			}

		}
		
		gardenService.updateDailylog(log);
		
		reAttr.addAttribute("logNo", log.getLogNo());
		
		reAttr.addFlashAttribute("msg", "?????????????????? ??????????????????.");
				
		return "redirect:logDetail.do";
	}
	
	@RequestMapping("deleteDailyLog.do")
	public String deleteDailyLog(String logNo, String fileName, HttpServletRequest request, RedirectAttributes reAttr) {
		
		gardenService.deleteDailyLog(logNo);
		
		if(!fileName.equals("")) {
			//????????? ????????? ????????? ????????? ????????????
			deleteFile(fileName, request);
		}
		
		reAttr.addFlashAttribute("msg", "?????????????????? ??????????????????.");
		
		return "redirect:dailyLog.do";
	}
	

	//=========================================================================================
	//??????????????? ?????? 

	@ResponseBody
	@RequestMapping(value = "selectCommentList.do", produces="application/json; charset=utf-8")
	public ArrayList<DailyLogComment> selectLogCommentList(String logNo) {
		
		ArrayList<DailyLogComment> comment = gardenService.selectLogCommentList(logNo);
				
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
	//???????????? ??????
	@RequestMapping("myPlant.do")
	public String myPlantMain(@RequestParam(value="currentPage" , required=false, defaultValue="1") int currentPage,
								HttpSession session, Model model) {
		String hostUser = (String) session.getAttribute("hostUser");
		
		System.out.println("hostUser ??? ?????? ??? " + hostUser);
		
		if(hostUser == null) {
			hostUser = ((Member) session.getAttribute("loginUser")).getUserId();
			session.setAttribute("hostUser", hostUser);
		}
		
		System.out.println("hostUser ??? ?????? ??? " + hostUser);
		
		int myPlantCount = gardenService.selectMyPlantCount(hostUser);
		
		PageInfo pi = GardenPagination.getPageInfo(myPlantCount, currentPage, 10, 5);
		
		ArrayList<MyPlant> myPlant = gardenService.selectMyPlantList(hostUser, pi);
		
		model.addAttribute("myPlant", myPlant);
		model.addAttribute("pi", pi);

		return "garden/myPlantMain";
	}
	
	@RequestMapping("insertMyPlantForm.do")
	public String insertMyPlantForm(Model model) {
		
		//?????? ????????? ???????????? ????????? ?????? ???
		PageInfo pi = GardenPagination.getPageInfo(100, 1, 10, 10);
		String search = null;
		
		ArrayList<PlantInfo> info = gardenService.selectPlantList(pi, search);
		
		model.addAttribute("info", info);
		
		return "garden/myPlantInsertForm";
	}
	
	
	@RequestMapping("insertMyPlant.do")
	public String insertMyPlant(@RequestParam(name = "upfile", required=false)MultipartFile file, 
								MyPlant myPlant, HttpServletRequest request, RedirectAttributes reAttr) {
		
		//????????? ????????? ?????? ????????? ?????????????????? ???????????? ???
		if(myPlant.getNickname().equals("")) {
			myPlant.setNickname(myPlant.getPlantName());
		}

		String changeName = saveFile(file,request);
		
		if(changeName != null) {
			myPlant.setFileName(file.getOriginalFilename());
			myPlant.setServerName(changeName);
		}

		gardenService.insertMyPlant(myPlant);
		reAttr.addFlashAttribute("msg", "??? ?????? ????????? ??????????????????.");
			
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
		if(!file.getOriginalFilename().equals("")) {//?????? ????????? ????????? ?????? ??????
				
			String changeName = saveFile(file, request);
			
			plant.setFileName(file.getOriginalFilename());
			plant.setServerName(changeName);
			
			if(orgChangeName != null) {//?????? ????????? ?????? ?????? --> ????????? ???????????? ?????? ?????? ??????
				deleteFile(orgChangeName, request);
			}
		}
		
		//????????? ????????? ?????? ????????? ?????????????????? ???????????? ???
		if(plant.getNickname().equals("")) {
			plant.setNickname(plant.getPlantName());
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
	
	@RequestMapping("updatePlantGrowForm.do")
	public String selectPlantGrow(String listNo, Model model){
		
		PlantGrow plant = gardenService.selectPlantGrow(listNo);	
		
		model.addAttribute("plant", plant);
		
		return "garden/plantGrowUpdateForm";
		
	}
	
	@RequestMapping("updatePlantGrow.do")
	public String updatePlantGrow(PlantGrow plant, Model model) {
		
		if(plant.getWater() != null) {
			plant.setWater("Y");
		}else {
			plant.setWater("N");
		}
		
		if(plant.getSupplement() != null) {
			plant.setSupplement("Y");
		}else {
			plant.setSupplement("N");
		}
		
		if(plant.getRepotting() != null) {
			plant.setRepotting("Y");
		}else {
			plant.setRepotting("N");
		}

		gardenService.updatePlantGrow(plant);
		model.addAttribute("plantNo", plant.getPlantNo());

		return "redirect:myPlantDetail.do";
	}
	
	//=========================================================================================
	//????????? ??????
	
	@ResponseBody
	@RequestMapping(value = "selectCalendar.do", produces="application/json; charset=utf-8")
	public List<PlantGrow> monthPlan(String hostUser) {
		List<PlantGrow> list = gardenService.selectCalendar(hostUser);
		
		return list;
	}

	@RequestMapping("insertPlantGrow.do")
	public String insertPlantGrow(PlantGrow plant) {
		
		if(plant.getWater() != null) {
			plant.setWater("Y");
		}else {
			plant.setWater("N");
		}
		
		if(plant.getSupplement() != null) {
			plant.setSupplement("Y");
		}else {
			plant.setSupplement("N");
		}
		
		if(plant.getRepotting() != null) {
			plant.setRepotting("Y");
		}else {
			plant.setRepotting("N");
		}
		
		if(plant.getEtc().equals("")) {
			plant.setEtc("??????????????? ????????????.");
		}
		
		gardenService.insertPlantGrow(plant);
		
		return "redirect:gardenMain.do";
	}
	
	//=========================================================================================
	//????????????
	//???????????? ????????? ?????????????????? ????????? ???????????? ???????????? ??????
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		//???????????? . ???????????????????????? resources ?????? ?????? ??????
		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = resources + "\\garden_upload_files\\";
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // ?????????????????? ????????????
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// ?????? ????????? ???????????? ???
			e.printStackTrace();
			throw new CommException("File Upload Error");
		}
		
		return changeName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = resources + "\\garden_upload_files\\";
		
		//????????? ????????? ?????????
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
		
	}

}

