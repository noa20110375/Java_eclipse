package com.jqueryAddress;

import java.util.ArrayList;

public interface JAddressDAO {
 //�߰� 
	public void insert(AddressVO avo);
	
	
	
	//��ü����(�˻��ƴ�)
	public ArrayList<AddressVO>list();
	
	
	public ArrayList<AddressVO>searchList(String field, String word);
	//����(�˻� �ƴ�)
	public  int getCount();
		//���� (�˻�)
	public int getCount(String field,String word);
	
	
	
	//�󼼺���
	public AddressVO findByNum(int num);
	
	
	//����
	public void update(AddressVO avo);
	
	//����
	public void delete(int num);
	
	//�����ȣ �˻�
	
	public  ArrayList<ZipCodeVO> getZipcode(String dong) ;
		
	}

