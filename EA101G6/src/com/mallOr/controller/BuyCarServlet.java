package com.mallOr.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.MallService;
import com.mall.model.MallVO;

@WebServlet("/BuyCar/BuyCarServlet")
public class BuyCarServlet extends HttpServlet {
       
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;CharSet=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("buyone".equals(action)){
			String commNo=req.getParameter("commNo");
			MallService mallSvc=new MallService();
			MallVO mallVo = mallSvc.findOneByNo(commNo);
			req.setAttribute("mallVo",mallVo);
			String buyQuantity=req.getParameter("buyQuantity");
			req.setAttribute("buyQuantity",buyQuantity);
			System.out.println(buyQuantity);
			RequestDispatcher dispatchar=req.getRequestDispatcher("/fornt-end/MallOr/BuyOne.jsp");
			dispatchar.forward(req,res);
		}
		
		if("add".equals(action)){
			
			HttpSession session=req.getSession();
			String commName=req.getParameter("commName");
			String commNo=req.getParameter("commNo");
			String buyQuantity=req.getParameter("buyQuantity");
			
			System.out.println(buyQuantity);
			
			MallVO buyMallVo=new MallVO();
			
			buyMallVo.setCommName(commName);
			buyMallVo.setCommNo(commNo);
			buyMallVo.setQuantity(Integer.valueOf(buyQuantity));
			List<MallVO> buyCarList=new LinkedList<MallVO>();
			buyCarList.add(buyMallVo);
			session.setAttribute("buyCarList", buyCarList);
			RequestDispatcher dispatchar=req.getRequestDispatcher("/fornt-end/MallOr/BuyCar.jsp");
			dispatchar.forward(req,res);
		}
		
		
		
		
	}

}
