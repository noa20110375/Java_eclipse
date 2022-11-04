package com.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//static은 클래스 이름으로 불러짐.
public class AddressDAO {
	private static AddressDAO instance = new AddressDAO();
	public static AddressDAO getInstance() {
		return instance;
	}
	
	
	//DB연결 Connection  객체가 반드시 필요!.
	//PreparedStatement //미리 문자열 인식하고 나중에 넣음. 문자열 처리시 이거를 씀
	// Statement //아닐 경우 기본적으로 씀
	//ResultSet /// 위에 생성해야 SQL 결과문을 가져올 수 있음.
	//DBCP// 미리 만들어둔 풀에서 찾아옴.
	private Connection getConnection() throws Exception {
		Context  initCtx = new InitialContext();
		//enp폴더 밑에 내이름을 찾아옴.
		Context  envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource)envCtx.lookup("jdbc/jsp");
		return ds.getConnection();
	
	}
	
	//추가
	public  void addrInsert(Address ad) {
		Connection con = null ;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql = "insert into address values(address_seq.nextval,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getZipcode());
			ps.setString(3, ad.getAddr());
			ps.setString(4, ad.getTel());
			ps.executeUpdate();
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				closeConnection(con,ps,null,null);
		}
	}
	//전체 보기 
	public ArrayList<Address> addressList() {
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		
		try {
			con = getConnection();
			String sql = "select * from address ";
			st = con.createStatement();
		  rs= st.executeQuery(sql);
		  while(rs.next()) {
			  Address ad = new Address();
			  ad.setNum(rs.getInt("num"));
			  ad.setAddr(rs.getString("addr"));
			  ad.setName(rs.getString("name"));
			  ad.setTel(rs.getString("tel") );
			  ad.setZipcode(rs.getString("zipcode"));
			  arr.add(ad);
			  
		  }
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection(con, null, st, rs);
			
			
		}
		return arr;
	}
	
	//수정 
	



	//삭제
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
