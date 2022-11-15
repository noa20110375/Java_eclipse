package com.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class infoServlet extends HttpServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
			String name = req.getParameter("name");
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			
//			req.setAttribute("name", name);
//			req.setAttribute("id", id);
//			req.setAttribute("pwd", pwd);
//			req.setAttribute("phone", phone);
//			req.setAttribute("address", address);
		//객체 안에 저장함.
			//setter
//			Info info = new Info();
//			info.setAddress(address);
//			info.setId(id);
//			info.setName(name);
//			info.setPhone(phone);
//			info.setPwd(pwd);
			//꼭 세터 ,생성자 둘다 가능...
			//생성자
		Info info = new Info(name,id,pwd,phone,address);
			
		
		req.setAttribute("info", info);
			RequestDispatcher  rd= req.getRequestDispatcher("inforResult.jsp");
			rd.forward(req, resp);
		}
}
