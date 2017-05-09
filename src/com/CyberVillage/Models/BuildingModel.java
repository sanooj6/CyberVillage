package com.CyberVillage.Models;

public class BuildingModel 
{
	int buil_id,duration;
	String buil_name,buil_type,buil_descr,status,work_status;
	public String getWork_status() {
		return work_status;
	}
	public void setWork_status(String work_status) {
		this.work_status = work_status;
	}
	public int getBuil_id() {
		return buil_id;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public void setBuil_id(int buil_id) {
		this.buil_id = buil_id;
	}
	public String getBuil_name() {
		return buil_name;
	}
	public void setBuil_name(String buil_name) {
		this.buil_name = buil_name;
	}
	public String getBuil_type() {
		return buil_type;
	}
	public void setBuil_type(String buil_type) {
		this.buil_type = buil_type;
	}
	public String getBuil_descr() {
		return buil_descr;
	}
	public void setBuil_descr(String buil_descr) {
		this.buil_descr = buil_descr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}

