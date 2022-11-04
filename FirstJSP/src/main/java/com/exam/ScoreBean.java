package com.exam;



public class ScoreBean {
 private String name;
 private int korea;
 private int english;
 private int math;
 
 
 public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getKorea() {
	return korea;
}
public void setKorea(int korea) {
	this.korea = korea;
}
public int getEnglish() {
	return english;
}
public void setEnglish(int english) {
	this.english = english;
}
public int getMath() {
	return math;
}
public void setMath(int math) {
	this.math = math;
}
public int getTotal() {
	return korea+english+math;
}

public float getAvg() {
	return(korea+english+math)/3.0f;
}
public String getGrade() {
	String grade = "";
	switch (getTotal()/3 / 10) {
	//90~99 A
	//80~89 B
	//70~79 C
	//작은 거에 큰 거를 담을 때는 명시적 캐스팅을 해야함
	//a= (int)b; a:int b:long
	case 9:
		grade = "A";
		break;
	case 8:
		grade = "B";
		break;
	case 7:
		grade = "C";
		break;
	default:
		grade = "F";
		break;
		
}
	return grade;
}
}
