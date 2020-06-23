package com.mallOr.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.MallVO;
import com.mallOr.model.MallOrService;
import com.mallOr.model.MallOrVO;
import com.mallOrDt.model.MallOrDtVO;

@WebServlet("/MallOr/MallOrServlet")
public class MallOrServlet extends HttpServlet {

    public MallOrServlet() {

    }

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;Charset:UTF-8");
		String action=req.getParameter("action");
		HttpSession session=req.getSession();
		List<MallVO> buyCarList=(LinkedList<MallVO>) session.getAttribute("buyCarList");
		if("showCheckOut".equals(action)) {
			if(buyCarList.size()==0) {
				RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/buyCar/buyCar.jsp");
				req.setAttribute("noMallAlert","購物車無商品無法結帳");
				dispatcher.forward(req,res);
				return;
			}else {	
				RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/mallOr/mallOr.jsp");
				dispatcher.forward(req,res);
				return;
			}
			
		}
		
		
		if("checkOut".equals(action)) {
			List<String> erroList=new LinkedList<String>();
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			List<MallOrDtVO> mallOrDtList=new ArrayList<MallOrDtVO>();
			for( MallVO mallVo : buyCarList) {
				MallOrDtVO mallOrDtVo=new MallOrDtVO();
				mallOrDtVo.setCommNo(mallVo.getCommNo());
				mallOrDtVo.setPrice(mallVo.getPrice());
				mallOrDtVo.setQuantity(mallVo.getQuantity());
				mallOrDtList.add(mallOrDtVo);
			}
			
			MallOrService mallOrSvc=new MallOrService();
			//時間的部分現在時間 並不是讓使用者輸入沒有錯誤驗證
			java.sql.Timestamp orDate=new java.sql.Timestamp(new java.util.Date().getTime());
			//取貨方式 
			String take="";
			if(req.getParameter("take")!=null) {
				take=req.getParameter("take");
			}else {
				erroList.add("請勾選取貨方式");
			}
			//地址 到時會改成連動式
			String address="";
			if(req.getParameter("address").length()!=0) {
				address=req.getParameter("address");
			}else {
				erroList.add("請輸入地址");
			}
			//一開始是0未完成的狀態
			Integer status=0;
			//是1已完成繳款
			Integer payStatus=1;
			//一開始是0未出貨的狀態
			Integer boxStatus=0;
			//價錢el計算不是使用者輸入，只確定是不是大於8位數
			String priceReg="[0-9]{1,8}";
			String strPrice=req.getParameter("price");
			Integer price=null;
			if(strPrice.matches(priceReg)) {
				price=new Integer(strPrice);
			}else{
				erroList.add("金額過於龐大請分次處理");
			}
			
			if(!erroList.isEmpty()){
				RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/mallOr/mallOr.jsp");
				req.setAttribute("erroList",erroList);
				dispatcher.forward(req,res);
				return;
			}
			
			/*************************** 2.開始新增or的資料同時新增dt***************************************/
			MallOrVO mallOrVo=new MallOrVO(); 
			mallOrVo=mallOrSvc.add("BM00001", orDate, take, address, status, payStatus, boxStatus, price, mallOrDtList);
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			session.removeAttribute("buyCarList");
			req.setAttribute("mallOrVo",mallOrVo);
			req.setAttribute("mallOrDtList",mallOrDtList);
			RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/mallOr/mallOrGetOne.jsp");
			dispatcher.forward(req, res);
			return;
			
		}
		
	}

}
