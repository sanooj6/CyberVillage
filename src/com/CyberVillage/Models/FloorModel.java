package com.CyberVillage.Models;

public class FloorModel 
{
	int floor_id,buil_id;
	String floor_name,buil_name,status,descr;
	float rent;
	public float getRent() {
		return rent;
	}
	public void setRent(float rent) {
		this.rent = rent;
	}
	public int getFloor_id() {
		return floor_id;
	}
	public void setFloor_id(int floor_id) {
		this.floor_id = floor_id;
	}
	public int getBuil_id() {
		return buil_id;
	}
	public void setBuil_id(int buil_id) {
		this.buil_id = buil_id;
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
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
}
