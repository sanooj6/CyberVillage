package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.RoomModel;

public class RoomService 
{
		Connection 		con		=	DbConnection.getConnection();
		PreparedStatement	p;
		
		//........Insert Room................//
		public int RoomInsert(RoomModel rm) 
		{
			int result = 0;
			try
			{
				p=con.prepareStatement("insert into room(floor_id,room_name,squarefeet,status,door_num) values(?,?,?,?,?)");
				p.setInt(1, rm.getFloor_id());
				p.setString(2, rm.getR_name());
				p.setFloat(3, rm.getS_feet());
				p.setString(4,"Active");
				p.setString(5, rm.getDoor_num());
				result = p.executeUpdate();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return result;
		}
		
		//.............Select All Rooms.....................//
		public ArrayList<RoomModel>SelectAllRooms()
		{
			ArrayList<RoomModel> arr	=	new ArrayList<RoomModel>();
			RoomModel	rm;
			try
			{
				p						=	con.prepareStatement("select room.*,building.buil_id,building.buil_name,floor.floor_name,room_rent.rent,company_reg.comp_name from room inner join floor on floor.floor_id = room.floor_id inner join building on floor.buil_id=building.buil_id inner join room_rent on room.room_id=room_rent.room_id left join company_reg on company_reg.room_id = room.room_id order by room.room_id asc");
				ResultSet	rs			=	p.executeQuery();
				//System.out.print(p);
				while(rs.next())
				{
					rm 					=	new RoomModel();
					rm.setRoom_id(rs.getInt(1));
					rm.setFloor_id(rs.getInt(2));
					rm.setR_name(rs.getString(3));
					rm.setS_feet(rs.getFloat(4));
					rm.setStatus(rs.getString(6));
					rm.setOccupied(rs.getInt(7));
					rm.setDoor_num(rs.getString(8));
					rm.setBuil_id(rs.getInt(9));
					rm.setBuil_name(rs.getString(10));
					rm.setFloor_name(rs.getString(11));
					rm.setRent(rs.getFloat(12));
					rm.setOccupied_name(rs.getString(13));
					arr.add(rm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return arr;
		}
		
		
		//.............Select  Rooms By Id.....................//
		public RoomModel SelectRoomsById(int id)
		{
			RoomModel	rm				=	new RoomModel();
			try
			{
				p						=	con.prepareStatement("select room.*,building.buil_id,building.buil_name,floor.floor_name,room_rent.rent,company_reg.comp_name from room inner join floor on floor.floor_id = room.floor_id inner join building on floor.buil_id=building.buil_id inner join room_rent on room.room_id=room_rent.room_id left join company_reg on company_reg.room_id = room.room_id where room.room_id = ? order by room.room_id asc");
				p.setInt(1,id);
				ResultSet	rs			=	p.executeQuery();
				//System.out.print(p);
				while(rs.next())
				{
					rm.setRoom_id(rs.getInt(1));
					rm.setFloor_id(rs.getInt(2));
					rm.setR_name(rs.getString(3));
					rm.setS_feet(rs.getFloat(4));
					rm.setStatus(rs.getString(6));
					rm.setOccupied(rs.getInt(7));
					rm.setDoor_num(rs.getString(8));
					rm.setBuil_id(rs.getInt(9));
					rm.setBuil_name(rs.getString(10));
					rm.setFloor_name(rs.getString(11));
					rm.setRent(rs.getFloat(12));
					rm.setOccupied_name(rs.getString(13));
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return rm;
		}
		
		//........Update Room................//
		public int RoomUpdate(RoomModel rm) 
		{
			int result = 0;
			try
			{
				p=con.prepareStatement("update room set floor_id=?,room_name=?,squarefeet=?,door_num=? where room_id=?");
				p.setInt(1, rm.getFloor_id());
				p.setString(2, rm.getR_name());
				p.setFloat(3, rm.getS_feet());
				p.setString(4, rm.getDoor_num());
				p.setInt(5, rm.getRoom_id());
				result = p.executeUpdate();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return result;
		}
		
		//.............Select All Rooms.....................//
		public ArrayList<RoomModel>SelectRoomsByFloor(int floor)
		{
			ArrayList<RoomModel> arr	=	new ArrayList<RoomModel>();
			RoomModel	rm;
			try
			{
				p						=	con.prepareStatement("select room.*,building.buil_id,building.buil_name,floor.floor_name,room_rent.rent,company_reg.comp_name from room inner join floor on floor.floor_id = room.floor_id inner join building on floor.buil_id=building.buil_id inner join room_rent on room.room_id=room_rent.room_id left join company_reg on company_reg.room_id = room.room_id where room.floor_id = ? order by room.room_id asc");
				p.setInt(1,floor);
				ResultSet	rs			=	p.executeQuery();
				while(rs.next())
				{
					rm 					=	new RoomModel();
					rm.setRoom_id(rs.getInt(1));
					rm.setFloor_id(rs.getInt(2));
					rm.setR_name(rs.getString(3));
					rm.setS_feet(rs.getFloat(4));
					rm.setStatus(rs.getString(6));
					rm.setOccupied(rs.getInt(7));
					rm.setDoor_num(rs.getString(8));
					rm.setBuil_id(rs.getInt(9));
					rm.setBuil_name(rs.getString(10));
					rm.setFloor_name(rs.getString(11));
					rm.setRent(rs.getFloat(12));
					rm.setOccupied_name(rs.getString(13));
					arr.add(rm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return arr;
		}
}
