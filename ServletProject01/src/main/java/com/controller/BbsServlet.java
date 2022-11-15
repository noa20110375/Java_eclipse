package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BbsServlet  extends HttpServlet{
	
				@Override
				protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					String name = req.getParameter("name");
					String subject = req.getParameter("subject");
					String memo = req.getParameter("memo");
					
					
					resp.setContentType("text/html;charset=utf-8");
					   PrintWriter out = resp.getWriter();
					   out.println("<html>");
					   out.println("<head>");
					   out.println("<body>");
					   out.println("<b> 이름: "+name+" </b>");
					   out.println("<br/>");
					   out.println("<b> 제목: "+subject+" </b>");
					   out.println("<br/>");
					   out.println("<b> 내용: "+memo+" </b>");
					   out.println("</body>");
					   out.println("</head>");
					   out.println("</html>");
				}
}
