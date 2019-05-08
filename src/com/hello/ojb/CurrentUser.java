package com.hello.ojb;

public class CurrentUser {
	int id;
	String fullname;
	public CurrentUser() {
		this.id = 0;
		this.fullname = "";
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
}
