package com.mallOr.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MallOr/MallOrServlet")
public class MallOrServlet extends HttpServlet {

    public MallOrServlet() {

    }

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;Charset:UTF-8");
		String action=req.getParameter("action");
		
		if("checkOut".equals(action)) {
			
		}
		
	}

}
