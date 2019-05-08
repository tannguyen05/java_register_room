package com.hello.ojb;

public class Register {
	int id;
	int ca;
	int thu;
	String mon;
	String lop;
	String buoithaythe;
	String name;
	int user_id;
	
	public Register() {
		
	}
	public Register(int id, int ca, int thu, String mon, String lop, String buoithaythe, String name, int user_id) {
		this.id = id;
		this.ca = ca;
		this.thu = thu;
		this.mon = mon;
		this.lop = lop;
		this.buoithaythe = buoithaythe;
		this.name = name;
		this.user_id = user_id;
	}
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public int getCa() {
		return ca;
	}

	public void setCa(int ca) {
		this.ca = ca;
	}

	public int getThu() {
		return thu;
	}

	public void setThu(int thu) {
		this.thu = thu;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getLop() {
		return lop;
	}

	public void setLop(String lop) {
		this.lop = lop;
	}

	public String getBuoithaythe() {
		return buoithaythe;
	}

	public void setBuoithaythe(String buoithaythe) {
		this.buoithaythe = buoithaythe;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
