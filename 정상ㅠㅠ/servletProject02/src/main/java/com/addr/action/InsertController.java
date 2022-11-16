package com.addr.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.addr.model.AddrDTO;
import com.addr.model.SAddrDAO;
import com.addr.model.SAddrDAOImpl;

/**
 * Servlet implementation class AddrServlet
 */
@WebServlet("/addr/insert.addr")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("addr_insert.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 //AddrDTO 객체를 부름.
			AddrDTO addr = new AddrDTO();
			addr.setAddr(request.getParameter("addr"));
			addr.setName(request.getParameter("name"));
			addr.setTel(request.getParameter("tel"));
			addr.setZipcode(request.getParameter("zipcode"));
			
			SAddrDAO dao = SAddrDAOImpl.getInstnace();
			dao.addrInsert(addr);//추가 출력
		//인서트 입력 후 리스트 화면 출력.
			//관계가 계속유지되고 있음.  계속 값이 들어감 리프래쉬하면.
		//	RequestDispatcher rd = request.getRequestDispatcher("list.addr");
		//	rd.forward(request, response);
			
			response.sendRedirect("list.addr");
	}

}
