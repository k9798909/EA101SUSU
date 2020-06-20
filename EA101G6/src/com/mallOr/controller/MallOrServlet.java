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
				RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/BuyCar/BuyCar.jsp");
				req.setAttribute("noMallAlert","購物車無商品無法結帳");
				dispatcher.forward(req,res);
			}else {	
				RequestDispatcher dispatcher=req.getRequestDispatcher("/front-end/MallOr/MallOr.jsp");
				dispatcher.forward(req,res);
			}
			
		}
		
		
		if("checkOut".equals(action)) {
			
			List<MallOrDtVO> mallOrDtList =new ArrayList<MallOrDtVO>();
			for( MallVO mallVo : buyCarList) {
				MallOrDtVO mallOrDtVo
				mallOrDtList.add()
			}
			
			
			
		}
		
	}

}
