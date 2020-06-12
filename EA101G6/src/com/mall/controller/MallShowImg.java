package com.mall.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.MallService;
import com.mall.model.MallVO;

/**
 * Servlet implementation class mallshowimg
 */
@WebServlet("/Mall/MallShowImg")
public class MallShowImg extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		try {	
				//讀一次之後存到session裡讓效能好一點
				HttpSession session =req.getSession();
				MallVO mallvo=null;
				String commNo=req.getParameter("commNo");
				if(session.getAttribute(commNo)==null) {
					MallService ser = new MallService();
					mallvo =ser.findOneByNo(commNo);
					out.write(mallvo.getImg());
					session.setAttribute(commNo,(Object)mallvo);
				}else {
					mallvo=(MallVO)session.getAttribute(commNo);
					out.write(mallvo.getImg());
				}
			}catch(NullPointerException e) {
				//沒有圖片給他一張圖片
				e.getStackTrace();
				InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}	
	
	
	}

}
