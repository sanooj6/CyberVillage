package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.BuildingModel;

public class BuildingService 
{
	Connection  con     = 	DbConnection.getConnection();
	PreparedStatement p;
	
	/*............Insert Building.............*/
	public int BuildingInsert(BuildingModel bm) 
	{
		int  result     =	0;
		try
		{
			p=con.prepareStatement("insert into building(buil_name,buil_type,description,duration,status,work_status) values(?,?,?,?,?,?)");
			p.setString(1, bm.getBuil_name());
			p.setString(2, bm.getBuil_type());
			p.setString(3, bm.getBuil_descr());
			p.setInt(4, bm.getDuration());
			p.setString(5,"Active");
			p.setString(6, "Not_Working");
			result       =	p.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	//........................................Select All Building.......................................
	
	
	public ArrayList<BuildingModel> selectAllBuilding()
	{
		BuildingModel bm;
		ArrayList<BuildingModel> arr=new ArrayList<BuildingModel>();
		try
		{
			p=con.prepareStatement("SELECT * FROM building");
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				bm=new BuildingModel();
				bm.setBuil_id(rs.getInt(1));
				bm.setBuil_name(rs.getString(2));
				bm.setBuil_type(rs.getString(3));
				bm.setBuil_descr(rs.getString(4));
				bm.setDuration(rs.getInt(5));
				bm.setStatus(rs.getString(6));
				bm.setWork_status(rs.getString(7));
				arr.add(bm);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return arr;
	}
	
	//////////////Select Building By Id////////////////////////
	public BuildingModel SelectById(int id)
	{
		BuildingModel bm    =	new BuildingModel();
		try
		{
			p=con.prepareStatement("SELECT * FROM building WHERE buil_id = ?");
			p.setInt(1, id);
			ResultSet rs=p.executeQuery();
			while(rs.next())
			{
				bm.setBuil_id(rs.getInt(1));
				bm.setBuil_name(rs.getString(2));
				bm.setBuil_type(rs.getString(3));
				bm.setBuil_descr(rs.getString(4));
				bm.setDuration(rs.getInt(5));
				bm.setStatus(rs.getString(6));
				bm.setWork_status(rs.getString(7));
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return bm;
	}
	
	/*............Insert Building.............*/
	public int BuildingUpdate(BuildingModel bm) 
	{
		int  result     =	0;
		try
		{
			p=con.prepareStatement("update building set buil_name=?,buil_type=?,description=?,duration=? where buil_id = ?");
			p.setString(1, bm.getBuil_name());
			p.setString(2, bm.getBuil_type());
			p.setString(3, bm.getBuil_descr());
			p.setInt(4, bm.getDuration());
			p.setInt(5, bm.getBuil_id());
			result       =	p.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	
}
