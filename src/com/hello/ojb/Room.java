package com.hello.ojb;

public class Room {
	int id;
	String room;
	
	public Room(int id, String room) {
		this.id = id;
		this.room = room;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}
	
}
