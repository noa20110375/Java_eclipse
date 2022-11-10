package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.member.dto.MemberDTO;

public class MemberDAOImpl  implements MemberDAO{
	
	private static MemberDAO instance = new MemberDAOImpl();
	//MemberDAO 객체를 반환
	public static MemberDAO getInstance() {
		return instance;
	}

	//DB 연결 톰캣dbcb로 scott에 연결
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
		
	}
	@Override
	//추가
	public void memberInsert(MemberDTO member) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql = " insert into memberdb (name,userid,pwd,email,phone,admin) "
			+ " values(?,?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getUserid());
			ps.setString(3, member.getPwd());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getPhone());
			ps.setInt(6, member.getAdmin());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con,ps,null,null);
		}
	}

	@Override
	//전체보기
	public ArrayList<MemberDTO> memberList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			try {
			con = getConnection();
		
			String	 sql = "select * from memberdb ";

			st = con.createStatement();
		  rs= st.executeQuery(sql);	
				
		
		  while(rs.next()) {
			  MemberDTO mb = new MemberDTO();
			  mb.setAdmin(rs.getInt("admin"));
			  mb.setEmail(rs.getString("email"));
			  mb.setName(rs.getString("name"));
			  mb.setPhone(rs.getString("phone"));
			  mb.setPwd(rs.getString("pwd"));
			  mb.setUserid(rs.getString("userid"));
		      arr.add(mb);
		  }
		  } catch (Exception e) {
			  e.printStackTrace();
			}finally {
				closeConnection(con, null, st, rs);
				
				
			}
			return arr;
		}

	@Override
	public void memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberDelete(String userid) {
		Connection con = null;
		 Statement st = null;
			try {
				con = getConnection();
				String sql = "delete from memberdb where userid='"+userid+"'";
				st = con .createStatement();
				st.executeUpdate(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConnection(con,null,st,null);
			}
		
	}

	@Override
	public MemberDTO findById(String userid) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		MemberDTO mb = null;
		
	
	try {
		con =getConnection();
		String  sql = "select * from memberdb where userid = '"+userid+"'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		 mb = new MemberDTO();
	
	if(rs.next()) {
		
		//여기 안에서 선언하면 if 안에서만 사용 가능함
		//그러니 외부에 선언을 해줘야함
		 
		  //sql developer에 들어 있는 컬럼명이 들어감  그러니 일치 해야함.
		  mb.setAdmin(rs.getInt("admin"));
		  mb.setEmail(rs.getString("email"));
		  mb.setName(rs.getString("name"));
		  mb.setPhone(rs.getString("phone"));
		  mb.setPwd(rs.getString("pwd"));
		  mb.setUserid(rs.getString("userid"));
	      
		  
	}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeConnection(con, null, st, rs);
		}
			return mb;
	}
	
	@Override
	//아이디 중복확인
	public String idCheck(String userid) {
			Connection con =null;
			Statement st = null;
			ResultSet rs = null;
			String flag = "yes";
			try {
				con = getConnection();
				//userid 가 있는지 없는지 
				//userid 가 있으면 no userid 가 없으면 yes
				String sql = "select *from memberdb where userid = '"+userid+ "'";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				
				
				if(rs.next()) {
		
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConnection(con, null, st, rs);
			}
		return flag;
	}

	@Override
	public int loginCheck(String userid, String pwd) {
		Connection con =null;s
		Statement st = null;
		ResultSet rs = null;
		int check =  0;
		try {
			con = getConnection();
			
			String sql = "select *from memberdb where userid=  '"+userid+ "'";
		
			st = con.createStatement();
			rs = st.executeQuery(sql);
			
			
			if(rs.next()) {
				check = rs.getInt(1);
				check = rs.getInt(2);
				check = rs.getInt(3);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
	return 0 ;
}

	@Override
	public int getCount() {
		Connection  con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
			 sql = "select count(*) from memberdb";
			 st= con.createStatement();
				rs= st.executeQuery(sql);
				if(rs.next()) {
					count = rs.getInt(1);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	private void closeConnection (Connection con, PreparedStatement ps, Statement st, ResultSet rs ) {
		try {
		if (con != null)  con.close();
		if (ps != null)    ps.close();
		if (st != null)     st.close();
		if (rs != null)    rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
