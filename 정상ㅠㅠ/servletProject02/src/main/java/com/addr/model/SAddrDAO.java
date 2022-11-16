package com.addr.model;

import java.util.ArrayList;

public interface SAddrDAO {
 //�߰�
	public void addrInsert(AddrDTO addr) ;
	
	
	//��ü����(�˻� ����)
	public ArrayList<AddrDTO> addrList();
	
	
	//�󼼺���
	public  AddrDTO addrDetail(int num);
	
	
	//����//���� �־ �ǰ� ��� �ǰ�
	public void  addrUpdate(AddrDTO addr);
	
	
	//����//���� ��
	public void addrDelete(int num);
	
	//�˻�(��ü����)
	public ArrayList<AddrDTO> addrSearchList(String field, String word);
	
	
	

	//����(�˻��Ӵ�)
	public  int addrCount();
	
	//����(�˻���)
		public  int addrSearchCount(String field, String word);
		
	
	
	//�����ȣ �˻�
		
		public ArrayList<ZipDTO> addrZipRead(String dong);
}

