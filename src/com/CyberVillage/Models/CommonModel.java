package com.CyberVillage.Models;

public class CommonModel 
{
	int total_comp,active_comp,total_users,active_users,total_vacancy,active_vacancy,total_building,active_building,approve_comp;
	int total_floor,active_floor,total_room,active_room,occupied_room,pending_rent,total_application,pending_application,invited_application;
	public int getTotal_comp() {
		return total_comp;
	}
	
	public int getApprove_comp() {
		return approve_comp;
	}

	public void setApprove_comp(int approve_comp) {
		this.approve_comp = approve_comp;
	}

	public int getTotal_application() {
		return total_application;
	}

	public void setTotal_application(int total_application) {
		this.total_application = total_application;
	}

	public int getPending_application() {
		return pending_application;
	}

	public void setPending_application(int pending_application) {
		this.pending_application = pending_application;
	}

	public int getInvited_application() {
		return invited_application;
	}

	public void setInvited_application(int invited_application) {
		this.invited_application = invited_application;
	}

	public void setTotal_comp(int total_comp) {
		this.total_comp = total_comp;
	}
	public int getActive_comp() {
		return active_comp;
	}
	public void setActive_comp(int active_comp) {
		this.active_comp = active_comp;
	}
	public int getTotal_users() {
		return total_users;
	}
	public void setTotal_users(int total_users) {
		this.total_users = total_users;
	}
	public int getActive_users() {
		return active_users;
	}
	public void setActive_users(int active_users) {
		this.active_users = active_users;
	}
	public int getTotal_vacancy() {
		return total_vacancy;
	}
	public void setTotal_vacancy(int total_vacancy) {
		this.total_vacancy = total_vacancy;
	}
	public int getActive_vacancy() {
		return active_vacancy;
	}
	public void setActive_vacancy(int active_vacancy) {
		this.active_vacancy = active_vacancy;
	}
	public int getTotal_building() {
		return total_building;
	}
	public void setTotal_building(int total_building) {
		this.total_building = total_building;
	}
	public int getActive_building() {
		return active_building;
	}
	public void setActive_building(int active_building) {
		this.active_building = active_building;
	}
	public int getTotal_floor() {
		return total_floor;
	}
	public void setTotal_floor(int total_floor) {
		this.total_floor = total_floor;
	}
	public int getActive_floor() {
		return active_floor;
	}
	public void setActive_floor(int active_floor) {
		this.active_floor = active_floor;
	}
	public int getTotal_room() {
		return total_room;
	}
	public void setTotal_room(int total_room) {
		this.total_room = total_room;
	}
	public int getActive_room() {
		return active_room;
	}
	public void setActive_room(int active_room) {
		this.active_room = active_room;
	}
	public int getOccupied_room() {
		return occupied_room;
	}
	public void setOccupied_room(int occupied_room) {
		this.occupied_room = occupied_room;
	}
	public int getPending_rent() {
		return pending_rent;
	}
	public void setPending_rent(int pending_rent) {
		this.pending_rent = pending_rent;
	}
	
}
