package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.FloorModel;

public class FloorService 
{
	Connection con = DbConnection.getConnection();
	PreparedStatement p;
	//........Insert Floor................//
	public int FloorInsert(FloorModel fm) 
	{
		int result = 0;
		try
		{
			p=con.prepareStatement("insert into floor(buil_id,floor_name,description,status,rent) values(?,?,?,?,?)");
			p.setInt(1, fm.getBuil_id());
			p.setString(2, fm.getFloor_name());
			p.setString(3, fm.getDescr());
			p.setString(4,"Active");
			p.setFloat(5,fm.getRent());
			result = p.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	//........................................Select All Floor.......................................
	
	
	public ArrayList<FloorModel> selectAllFloor()
	{
		FloorModel fm;
		ArrayList<FloorModel> arr=new ArrayList<FloorModel>();
		try
		{
			p=con.prepareStatement("SELECT building.buil_name,floor.floor_id,floor.buil_id,floor.floor_name,floor.description,floor.status,floor.rent FROM floor INNER JOIN building ON floor.buil_id=building.buil_id ");
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				fm=new FloorModel();
				fm.setBuil_name(rs.getString(1));
				fm.setFloor_id(rs.getInt(2));
				fm.setBuil_id(rs.getInt(3));
				fm.setFloor_name(rs.getString(4));
				fm.setDescr(rs.getString(5));
				fm.setStatus(rs.getString(6));
				fm.setRent(rs.getFloat(7));
				arr.add(fm);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return arr;
	}
	
	public FloorModel SelectById(int id)
	{
		FloorModel fm=new FloorModel();
		try
		{
			p=con.prepareStatement("SELECT building.buil_name,floor.floor_id,floor.buil_id,floor.floor_name,floor.description,floor.status,floor.rent FROM floor INNER JOIN building ON floor.buil_id=building.buil_id where floor.floor_id = ?");
			p.setInt(1, id);
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				fm.setBuil_name(rs.getString(1));
				fm.setFloor_id(rs.getInt(2));
				fm.setBuil_id(rs.getInt(3));
				fm.setFloor_name(rs.getString(4));
				fm.setDescr(rs.getString(5));
				fm.setStatus(rs.getString(6));
				fm.setRent(rs.getFloat(7));
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return fm;
	}
	
	//........Update Floor................//
		public int FloorUpdate(FloorModel fm) 
		{
			int result = 0;
			try
			{
				p=con.prepareStatement("update floor set buil_id =? ,floor_name=?,description=?,rent=? where floor_id=?");
				p.setInt(1, fm.getBuil_id());
				p.setString(2, fm.getFloor_name());
				p.setString(3, fm.getDescr());
				p.setInt(5,fm.getFloor_id());
				p.setFloat(4, fm.getRent());
				result = p.executeUpdate();
				System.out.print(p);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return result;
		}
}
