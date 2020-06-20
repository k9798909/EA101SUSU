package com.mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.MallService;
import com.mall.model.MallVO;


@WebServlet("/Mall/ForntMallServlet")
public class ForntMallServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html ; Charset:UTF-8");

		String action=req.getParameter("action");
		if ("selName".equals(action)) {
			try {
		/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				MallService mallSvc = new MallService();
				String selErroMsg="";
				String selName = req.getParameter("selName").trim();
				String selNameReg = "^[(\u4e00-\u9fa5) _\\w]{1,20}$";
				List<MallVO> selMallVoList=null;
				if (selName.length() != 0 && selName.matches(selNameReg)){
					selMallVoList = mallSvc.findByNameUp(selName);
				}else {
					selErroMsg="商品名稱格式輸入錯誤，請輸入20字以內，請不要有特殊字元。";
					req.setAttribute("selErroMsg",selErroMsg);
					req.getRequestDispatcher("/front-end/Mall/MallSelNameUp.jsp").forward(req, res);
				}
		/*************************** 2.查詢完成,準備轉交(Send the Success view) ***********/	
				if(selMallVoList.isEmpty()) {
					selErroMsg="查無此資料";
					req.setAttribute("selErroMsg",selErroMsg);
					req.getRequestDispatcher("/front-end/Mall/MallSelNameUp.jsp").forward(req, res);
				}else {
					req.setAttribute("selMallVoList", selMallVoList);
					req.getRequestDispatcher("/front-end/Mall/MallSelNameUp.jsp").forward(req, res);
				}
				
			}catch (Exception e) {
				e.getStackTrace();
				res.sendRedirect(req.getContextPath() + "/front-end/Mall/MallGetAllUp.jsp");
			}	
				
			
		}
		
	}

}
