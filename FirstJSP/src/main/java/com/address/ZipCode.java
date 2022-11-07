package com.address;

public class ZipCode {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;
	private int seq;
	
	
	//setter,getter
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido == null ? "":sido;
	}
	public String getGugun() {
		return gugun = gugun == null ? "":gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong == null ? "":dong;
	}
	public String getBunji() {
		//삼항연산자 확인.
		// n = (a==2)? 1:2;
		//trim앞뒤 문자공백 제거
		return bunji == null ? "" :bunji.trim();
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
}
