package com.jqueryAddress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.address.Address;
import com.address.AddressDAO;
import com.address.ZipCode;

public class JAddressDAOImpl implements JAddressDAO {

	private static JAddressDAO instance = new JAddressDAOImpl();
	public static JAddressDAO getInstance() {
		return instance;
	}
	
	
	//DB연결 Connection  객체가 반드시 필요!.
	//PreparedState	``````````````ment //미리 문자열 인식하고 나중에 넣음. 문자열 처리시 이거를 씀
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


	@Override
	//추가
	public void insert(AddressVO avo) {
		// TODO Auto-generated method stub
		Connection con = null ;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql =  "insert into address(num,name, zipcode, addr, tel) "
					+ " values(address_seq.nextval,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getZipcode());
			ps.setString(3, avo.getAddr());
			ps.setString(4, avo.getTel());
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
	public ArrayList<AddressVO> list() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> arrvo = new ArrayList<AddressVO>();
		
		try {
			con = getConnection();
			String sql = "select * from address order by num desc";
			st = con.createStatement();
		  rs= st.executeQuery(sql);
		  while(rs.next()) {
			  AddressVO ad = new AddressVO();
			  ad.setNum(rs.getInt("num"));
			  ad.setAddr(rs.getString("addr"));
			  ad.setName(rs.getString("name"));
			  ad.setTel(rs.getString("tel") );
			  ad.setZipcode(rs.getString("zipcode"));
			  arrvo.add(ad);
			  
		  }
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeConnection(con, null, st, rs);
			
			
		}
		return arrvo;
	}


	@Override
	//상세보기
	public AddressVO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		//여기 외부에 선언 
		AddressVO ad = null;
		try {
			con =getConnection();
			String  sql = "select * from address where num = " +  num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
		if(rs.next()) {
			//여기 안에서 선언하면 if 안에서만 사용 가능함
			//그러니 외부에 선언을 해줘야함
			  ad = new AddressVO();
			  //sql developer에 들어 있는 컬럼명이 들어감  그러니 일치 해야함.
			  ad.setNum(rs.getInt("num"));
			  ad.setAddr(rs.getString("addr"));
			  ad.setName(rs.getString("name"));
			  ad.setTel(rs.getString("tel") );
			  ad.setZipcode(rs.getString("zipcode"));
			  
		}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con,null,st,rs);
		}
		return ad;
	}


	@Override
	//카운트
	public int getCount() {
		//객체 생성 
		Connection  con= null;
		Statement st = null;
		ResultSet rs = null;
		
		int count = 0;
		

	//return 은 마지막에 값을 돌려줘야하니...하하하....
	try {
		con = getConnection();
		String sql = "select count(*) from address order by num desc";
		st= con.createStatement();
		rs= st.executeQuery(sql);
		if(rs.next()) {
			//안에서 선언하면 외부에서는 쓸 수 없기에 외부에 선언해서 넣으면 됨.
			count = rs.getInt(1);
		}
	
	}catch(Exception e){
		e.printStackTrace();
		
	}finally {
		closeConnection(con,null,st,rs);
	}
	return count;
	}


	@Override
	//수정
	public void update(AddressVO avo) {
		Connection con = null;
		PreparedStatement  ps = null;
	
		
		try {
			con = getConnection();
			String sql="update   address set name=?,  tel=?,"
					+ " zipcode=?, addr=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, avo.getName());
			ps.setString(2, avo.getTel());
			ps.setString(3, avo.getZipcode());
			ps.setString(4, avo.getAddr());
			ps.setInt(5, avo.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con, ps, null, null);
		}
		
	}


	@Override
	public void delete(int num) {
		Connection con = null;
		 Statement st = null;
			try {
				con = getConnection();
				String sql = "delete from address where num="+num;
				st = con .createStatement();
				st.execute(sql);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConnection(con,null,st,null);
			}
		
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


	@Override
	public ArrayList<ZipCodeVO> getZipcode(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zarr = new ArrayList<ZipCodeVO>();
		
		try {
		con = getConnection();
		//dong은 변수이기에 따옴표에 들어가면 x
		String sql = "select * from zipcode where dong like '%"+dong+"%'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()) {
			ZipCodeVO zip = new ZipCodeVO();
		zip.setBunji(rs.getString("bunji"));
		zip.setDong(rs.getString("dong"));
		zip.setGugun(rs.getString("gugun"));
		zip.setSeq(rs.getInt("seq"));
		zip.setSido(rs.getString("sido"));
		zip.setZipcode(rs.getString("zipcode"));
		zarr.add(zip);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		closeConnection(con,null,st,null);
	}
		return zarr;
	}


	@Override
	//전체보기 (검색)
	
	public ArrayList<AddressVO> searchList(String field, String word) {
		Connection  con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<AddressVO> arr = new ArrayList<AddressVO>();
		
		
		try {
			con = getConnection();
			String sql = "select * from address where "+ field+" like '%"+word+"%'" ;
			st =con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				AddressVO avo = new AddressVO();
				avo.setAddr(rs.getString("addr"));
				avo.setName(rs.getString("name"));
				avo.setNum(rs.getInt("num"));
				avo.setTel(rs.getString("tel"));

				avo.setZipcode(rs.getString("zipcode"));
				arr.add(avo);
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con,null,st,null);
		}
		return  arr;
	}


	@Override
	//개수(검색)
	public int getCount(String field, String word) {
		Connection  con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
	try {
		con = getConnection();
		String sql = "select count (*) from address where "+ field+" like '%"+word+"%'";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		if(rs.next()) {
			count = rs.getInt(1);
		}
			
	
	
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		closeConnection(con,null,st,null);
	}
		return count;
	}
	
	
}