package com.jqueryAddress;

import java.util.ArrayList;

public interface JAddressDAO {
 //추가 
	public void insert(AddressVO avo);
	
	
	
	//전체보기(검색아님)
	public ArrayList<AddressVO>list();
	
	
	public ArrayList<AddressVO>searchList(String field, String word);
	//개수(검색 아님)
	public  int getCount();
		//개수 (검색)
	public int getCount(String field,String word);
	
	
	
	//상세보기
	public AddressVO findByNum(int num);
	
	
	//수정
	public void update(AddressVO avo);
	
	//삭제
	public void delete(int num);
	
	//우편번호 검색
	
	public  ArrayList<ZipCodeVO> getZipcode(String dong) ;
		
	}

