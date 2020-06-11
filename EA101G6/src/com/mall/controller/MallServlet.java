package com.mall.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mall.model.MallService;
import com.mall.model.MallVO;

@WebServlet("/Mall/MallServlet")
@MultipartConfig
public class MallServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.sendRedirect(req.getContextPath() + "/back-end/Mall/MallGetAll.jsp");
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<String> erroMsg = new ArrayList<String>();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html ; Charset=UTF-8");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		String action = req.getParameter("action");

		/*****************************************************/
		/**													**/
		/**						以下是新增              					**/
		/**													**/
		/**													**/
		/*****************************************************/
		if ("mallAdd".equals(action)) {
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				MallVO mallVo = new MallVO();
				// commName部分
				String commName = req.getParameter("commName").trim();
				String commNameReg = "^[(\u4e00-\u9fa5) _\\w]{2,20}$";
				if (commName.length() != 0 && commName.matches(commNameReg))
					mallVo.setCommName(commName);
				else
					erroMsg.add("商品名稱格式輸入錯誤，請輸入20字以內，請不要有特殊字元。");

				// price部分
				Integer price = null;
				try {
					price = Integer.parseInt(req.getParameter("price"));
					if (price > 0 && price < 1000000)
						mallVo.setPrice(price);
					else
						erroMsg.add("價錢請不要小於0或大於1000000");
				} catch (NumberFormatException e) {
					erroMsg.add("價錢請輸入數字");
				}
				// quantity 部分
				Integer quantity = null;
				try {
					quantity = Integer.parseInt(req.getParameter("quantity"));
					if (quantity > 0 && quantity <= 100)
						mallVo.setQuantity(quantity);
					else
						erroMsg.add("數量請不要小於0或大於100字");

				} catch (NumberFormatException e) {
					erroMsg.add("數量請輸入數字");
				}

				// intro部分
				String intro = req.getParameter("intro").trim();
				if (intro.length() != 0 && intro.length() <= 100)
					mallVo.setIntro(intro);
				else
					erroMsg.add("商品介紹請不要輸入小於0或大於100");

				// age部分
				String age = req.getParameter("age").trim();
				String ageReg = "[0-9]{1,2}";
				if (age.length() != 0 && age.matches(ageReg)) {
					mallVo.setAge(age);
				} else
					erroMsg.add("適合年齡請勿輸入大於100或小於0");

				// player部分
				String player = req.getParameter("player").trim();
				String playerRex = "^\\d{1,2}[-~]{1}\\d{1,2}$";
				if (player.length() != 0 && player.matches(playerRex)) {
					mallVo.setPlayer(player);
				} else
					erroMsg.add("適合人數格式請輸入正確");
				
				//遊戲類型的部分

				

				// status 有選中==on 沒=null
				int status = 0;
				if (!(req.getParameter("status") == null)) {
					status = 1;
				}
				mallVo.setStatus(status);

				// img
				byte[] img = null;
				Part part = req.getPart("img");
				String imgReg = ".*(.jpg|.png|.gif|.jpeg)$";
				if (part.getSize() != 0 && getFileNameFromPart(part).matches(imgReg)) {
					InputStream in = part.getInputStream();
					// 如果大於1MB
					if (in.available() < 1000000) {
						img = new byte[in.available()];
						in.read(img);
						mallVo.setImg(img);
						System.out.println();
					} else
						erroMsg.add("圖片請勿超過1MB");

					in.close();
				} else
					erroMsg.add("請傳入圖片或確認符合圖片格式");

				// 如果錯誤訊息不等於空回到首頁
				if (!erroMsg.isEmpty()) {
					req.setAttribute("tempmallVo", mallVo);
					req.setAttribute("erroMsg", erroMsg);
					req.getRequestDispatcher("/back-end/Mall/MallGetAll.jsp").forward(req, res);
				} else {
					/*************************** 2.開始新增資料 ***************************************/
					MallService mallSer = new MallService();
					String msg=mallSer.add(commName, price, quantity, img, intro, age, player, status);
					/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
					// 讓前台list能更新
					session.removeAttribute("mallVoList");
					session.setAttribute("successMsg", msg);
					res.sendRedirect(req.getContextPath() + "/back-end/Mall/MallGetAll.jsp");
					return;
					// req.getRequestDispatcher("/back-end/Mall/MallGetAll.jsp").forward(req, res);
				}

			} catch (NullPointerException e) {
				e.getStackTrace();
			}
		}

		/*****************************************************/
		/**													**/
		/**						以下是修改               				**/
		/**													**/
		/**													**/
		/*****************************************************/
		
		if ("update".equals(action)) {
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				MallVO mallVo = new MallVO();
				// commNo
				String commNo = req.getParameter("commNo");
				// commName部分
				String commName = req.getParameter("commName").trim();
				String commNameReg = "^[(\u4e00-\u9fa5) _\\w]{2,20}$";
				if (commName.length() != 0 && commName.matches(commNameReg))
					mallVo.setCommName(commName);
				else
					erroMsg.add("商品名稱格式輸入錯誤，請輸入20字以內，請不要有特殊字元。");

				// price部分
				Integer price = null;
				try {
					price = Integer.parseInt(req.getParameter("price"));
					if (price > 0 && price < 1000000)
						mallVo.setPrice(price);
					else
						erroMsg.add("價錢請不要小於0或大於1000000");
				} catch (NumberFormatException e) {
					erroMsg.add("價錢請輸入數字");
				}
				// quantity 部分
				Integer quantity = null;
				try {
					quantity = Integer.parseInt(req.getParameter("quantity"));
					if (quantity > 0 && quantity <= 100)
						mallVo.setQuantity(quantity);
					else
						erroMsg.add("數量請不要小於0或大於100字");

				} catch (NumberFormatException e) {
					erroMsg.add("數量請輸入數字");
				}

				// intro部分
				String intro = req.getParameter("intro").trim();
				if (intro.length() != 0 && intro.length() <= 100)
					mallVo.setIntro(intro);
				else
					erroMsg.add("商品介紹請不要輸入小於0或大於100");

				// age部分
				String age = req.getParameter("age").trim();
				String ageReg = "[0-9]{1,2}";
				if (age.length() != 0 && age.matches(ageReg)) {
					mallVo.setAge(age);
				} else
					erroMsg.add("適合年齡請勿輸入大於100或小於0");

				// player部分
				String player = req.getParameter("player").trim();
				String playerRex = "^\\d{1,2}[-~]{1}\\d{1,2}$";
				if (player.length() != 0 && player.matches(playerRex)) {
					mallVo.setPlayer(player);
				} else
					erroMsg.add("適合人數格式請輸入正確");

				// status 有選中==on 沒=null
				int status = 0;
				if (!(req.getParameter("status") == null)) {
					status = 1;
				}
				mallVo.setStatus(status);

				// img
				byte[] img = null;
				Part part = req.getPart("img");
				String imgReg = ".*(.jpg|.png|.gif|.jpeg)$";

				if (part.getSize() != 0) {

					if (getFileNameFromPart(part).matches(imgReg)) {
						InputStream in = part.getInputStream();
						// 如果大於1MB
						if (in.available() < 1000000) {
							img = new byte[in.available()];
							in.read(img);
							mallVo.setImg(img);
						} else
							erroMsg.add("圖片請勿超過1MB");

						in.close();
					} else
						erroMsg.add("確認符合圖片格式");

				} else {
					// 因為沒有傳圖片拿出之前存在Showimg裡的 mallvo並拿出byte[]
					img = ((MallVO) session.getAttribute(commNo)).getImg();
				}

				// 如果錯誤訊息不等於空回到首頁
				if (!erroMsg.isEmpty()) {					
					req.setAttribute("showinsert", "showinsert");
					req.setAttribute("updateerroMsg", erroMsg);
					req.getRequestDispatcher("/back-end/Mall/MallGetAll.jsp").forward(req, res);
				} else {
					/*************************** 2.開始修改資料 ***************************************/
						MallService mallSer = new MallService();
						String msg=mallSer.update(commNo,commName, price, quantity, img, intro, age, player, status);
					/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
					// 讓前台list能更新
					session.removeAttribute("mallVoList");
					session.removeAttribute(commNo);
					session.setAttribute("successMsg", msg);
					res.sendRedirect(req.getContextPath() + "/back-end/Mall/MallGetAll.jsp");
					return;
					// req.getRequestDispatcher("/back-end/Mall/MallGetAll.jsp").forward(req, res);
				}
			} catch (NullPointerException e) {
				e.getStackTrace();
			}


		}
		
		/*****************************************************/
		/**													**/
		/**						查詢單筆          					**/
		/**													**/
		/**													**/
		/*****************************************************/
		if ("selectone".equals(action)) {
			try {
		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				MallService mallSer = new MallService();
				String selErroMsg="";
				String commName = req.getParameter("commName").trim();
				String commNameReg = "^[(\u4e00-\u9fa5) _\\w]{1,20}$";
				List<MallVO> mallVoList=null;
				if (commName.length() != 0 && commName.matches(commNameReg)){
					mallVoList = mallSer.findByName(commName);
				}else {
					selErroMsg="商品名稱格式輸入錯誤，請輸入20字以內，請不要有特殊字元。";
					session.setAttribute("selErroMsg",selErroMsg);
					res.sendRedirect(req.getContextPath() + "/back-end/Mall/MallGetAll.jsp");
					return;
				}
		/*************************** 2.查詢完成,準備轉交(Send the Success view) ***********/	
				if(mallVoList.isEmpty()) {
					selErroMsg="查無此資料";
					session.setAttribute("selErroMsg",selErroMsg);
					res.sendRedirect(req.getContextPath() + "/back-end/Mall/MallGetAll.jsp");
					return;
				}else {
					req.setAttribute("mallVoList", mallVoList);
					req.getRequestDispatcher("/back-end/Mall/MallGetOne.jsp").forward(req, res);
					return;
				}
				
			}catch (NullPointerException e) {
				e.getStackTrace();
			}	
			
			
			
			
			
			
			
			
		}
		
		
		
		
		

	}

	// 得到檔案名子
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		// System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		// System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}

}
