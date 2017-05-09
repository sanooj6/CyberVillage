package com.CyberVillage.Models;

public class RoomModel 
{
	int room_id,floor_id,occupied,buil_id;
	String r_name,door_num,floor_name,buil_name,status,occupied_name;
	float s_feet,rent;
	public String getOccupied_name() {
		return occupied_name;
	}
	public void setOccupied_name(String occupied_name) {
		this.occupied_name = occupied_name;
	}
	public float getRent() {
		return rent;
	}
	public void setRent(float rent) {
		this.rent = rent;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getFloor_id() {
		return floor_id;
	}
	public void setFloor_id(int floor_id) {
		this.floor_id = floor_id;
	}
	public int getOccupied() {
		return occupied;
	}
	public void setOccupied(int occupied) {
		this.occupied = occupied;
	}
	public int getBuil_id() {
		return buil_id;
	}
	public void setBuil_id(int buil_id) {
		this.buil_id = buil_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getDoor_num() {
		return door_num;
	}
	public void setDoor_num(String door_num) {
		this.door_num = door_num;
	}
	public String getFloor_name() {
		return floor_name;
	}
	public void setFloor_name(String floor_name) {
		this.floor_name = floor_name;
	}
	public String getBuil_name() {
		return buil_name;
	}
	public void setBuil_name(String buil_name) {
		this.buil_name = buil_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getS_feet() {
		return s_feet;
	}
	public void setS_feet(float s_feet) {
		this.s_feet = s_feet;
	}
	
}
