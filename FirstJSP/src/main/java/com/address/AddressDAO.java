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
			String sql =  "insert into address(num,name, zipcode, addr, tel) "
					+ " values(address_seq.nextval,?,?,?,?)";
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
	//전체 보기 (검색 포함)
	public ArrayList<Address> addressList(String field, String word) {
		
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Address> arr = new ArrayList<Address>();
		String sql ="";
		try {
			con = getConnection();
			if(word.equals("")){//검색 아님
				//String클래스에서는 equals()를 재정의해 내용을 비교
				//word = ""  워드가 공백이면 
				 sql = "select * from address order by num desc";
				
				
				
			}else {//검색
				
				//field ,word는 쌍따옴 표 안에서는 사용 할 수 없기에 ...."공백 + 컬럼+"해서 연결?
				
				sql = "select * from address where "+ field+" like '%"+word+"%'";
		
			}
			//sql문 출력 콘솔
			System.out.println(sql);
			
		
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
	//카운트 
	//field word 매개 변수로 넣어줌 
	public int getCount(String field, String word) {
		Connection  con= null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		

	//return 은 마지막에 값을 돌려줘야하니...하하하....
	try {
		con = getConnection();
		if(word.equals("")) {//검색 아님
			
		 sql = "select count(*) from address order by num desc";
		
		}else {//검색
			
			sql = "select count(*) from address where "+ field+" like '%"+word+"%'";
		}
		 st= con.createStatement();
		rs= st.executeQuery(sql);
		if(rs.next()) {
			count = rs.getInt(1);
		}
	
	}catch(Exception e){
		e.printStackTrace();
		
	}finally {
		closeConnection(con,null,st,rs);
	}
	return count;
	}
	//상세보기
	public Address getDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Address ad = null;
		try {
			con =getConnection();
			String  sql = "select * from address where num = " +  num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
		if(rs.next()) {
			  ad = new Address();
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
	//수정 
	public void addrUpdate(Address ad) {
		Connection con = null;
		PreparedStatement  ps = null;
	
		
		try {
			con = getConnection();
			String sql="update  address set name=?,  tel=?,"
					+ " zipcode=?, addr=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getTel());
			ps.setString(3, ad.getZipcode());
			ps.setString(4, ad.getAddr());
			ps.setInt(5, ad.getNum());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	//삭제
	public void addrDelete(int num) {
		Connection con = null;
	 Statement st = null;
		try {
			con = getConnection();
			String sql = "delete from address where num="+num;
			st = con .createStatement();
			st.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConnection(con,null,st,null);
		}
	
	}
	//우편번호검색
	
	public ArrayList<ZipCode> zipcodeRead(String dong) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<ZipCode> zarr = new ArrayList<ZipCode>();
	

		try {
			con = getConnection();
			//dong은 변수이기에 따옴표에 들어가면 x
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ZipCode zip = new ZipCode();
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
