package com.jqueryAddress;

import java.util.ArrayList;

public interface JAddressDAO {
 //�߰� 
	public void insert(AddressVO avo);
	
	
	
	//��ü����
	public ArrayList<AddressVO>list();
	
	
	//�󼼺���
	public AddressVO findByNum(int num);
	
	//����
	
	public  int getCount();
	//����
	public void update(AddressVO avo);
	
	//����
	public void delete(int num);
	
	//������ȣ �˻�
	
	public  ArrayList<ZipCodeVO> getZipcode(String dong) ;
		
	}
