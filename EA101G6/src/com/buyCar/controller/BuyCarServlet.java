package com.buyCar.controller;

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

import com.buyCar.model.BuyCarVO;
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
		PrintWriter out=res.getWriter();
		String action = req.getParameter("action");
		HttpSession session=req.getSession();
		
		
		if("buyone".equals(action)){
			String commNo=req.getParameter("commNo");
			String commName=req.getParameter("commName");
			String buyQuantity=req.getParameter("buyQuantity");
			String buyPrice=req.getParameter("buyPrice");
			
			BuyCarVO buyCarVo=new BuyCarVO(commNo,commName,buyQuantity,buyPrice);
			
			req.setAttribute("buyCarVo", buyCarVo);
			RequestDispatcher dispatchar=req.getRequestDispatcher("/fornt-end/BuyCar/BuyOne.jsp");
			dispatchar.forward(req,res);
		}
		
		if("add".equals(action)){
			
			try{
				String commNo=req.getParameter("commNo");
				String commName=req.getParameter("commName");
				String buyQuantity=req.getParameter("buyQuantity");
				String buyPrice=req.getParameter("buyPrice");
				
				MallService mallSvc=new MallService();
				MallVO mallVo=mallSvc.findOneByNo(commNo);
				//new物件
				BuyCarVO buyCarVo=new BuyCarVO(commNo,commName,buyQuantity,buyPrice);
				
				List<BuyCarVO> buyCarList=null;
				//如果session有list就拿出否則new 1個
				if(session.getAttribute("buyCarList")==null) {
					buyCarList=new LinkedList<BuyCarVO>();
					session.setAttribute("buyCarList",buyCarList);
				}else {
					buyCarList=(LinkedList<BuyCarVO>)session.getAttribute("buyCarList");
				}
				//確認list有沒有那個商品沒有就新增，有就拿出原本數量並+-
				int index=buyCarList.indexOf(buyCarVo);
				if(index<0) {
					buyCarList.add(buyCarVo);
					out.print("新增成功");
				}else {
					buyCarVo=buyCarList.get(index);
					Integer tempquantity= Integer.valueOf(buyQuantity)
							+Integer.valueOf(buyCarVo.getBuyQuantity());
					if(mallVo.getQuantity()>=tempquantity) {
					buyCarVo.setBuyQuantity(String.valueOf(tempquantity));
					out.print("新增成功");
					}else {
					out.print("購物車數量超過庫存");	
					}
				}
				
				
			}catch(Exception e){
				out.print("新增失敗!請稍後在試");
			}
			
			
		}
		
		if("delete".equals(action)){
			try{
				String commNo=req.getParameter("commNo");
				String commName=req.getParameter("commName");
				String buyQuantity=req.getParameter("buyQuantity");
				String buyPrice=req.getParameter("buyPrice");
				BuyCarVO buyCarVo=new BuyCarVO(commNo,commName,buyQuantity,buyPrice);
				List<BuyCarVO> buyCarList=null;
				if(session.getAttribute("buyCarList")!=null) {
					buyCarList=(LinkedList<BuyCarVO>)session.getAttribute("buyCarList");
					buyCarList.remove(buyCarVo);
					out.print("移除成功");
				}
			}catch(Exception e){
				out.print("移除失敗!請稍後在試");
			}
			
		}
		
		if("update".equals(action)){
			
			try{
				String commNo=req.getParameter("commNo");
				String commName=req.getParameter("commName");
				String buyQuantity=req.getParameter("buyQuantity");
				String buyPrice=req.getParameter("buyPrice");
				//new物件
				BuyCarVO buyCarVo=new BuyCarVO(commNo,commName,buyQuantity,buyPrice);
				
				List<BuyCarVO> buyCarList=null;
				//如果session有list就拿出
				if(session.getAttribute("buyCarList")!=null) {
					buyCarList=(LinkedList<BuyCarVO>)session.getAttribute("buyCarList");
				}
				//確認物件在哪個index，然後拿出更改
				int index=buyCarList.indexOf(buyCarVo);
				buyCarVo=buyCarList.get(index);
				buyCarVo.setBuyQuantity(buyQuantity);
				
				out.print("修改成功");
			}catch(Exception e){
				out.print("修改失敗!請稍後在試");
			}
			
			
		}
		
		
		
		
	}

}
