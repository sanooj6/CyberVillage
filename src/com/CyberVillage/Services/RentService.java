package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.RentModel;

public class RentService 
{
		Connection		con		=	DbConnection.getConnection();
		PreparedStatement	p;
		
		//.............Select My Rent due.....................//
		
		public ArrayList<RentModel> SelectMyDue(int id)
		{
			ArrayList<RentModel> 	arr	=	new ArrayList<>();
			RentModel 	rm;
			try
			{
				p				=	con.prepareStatement("select rent_company.*,room_rent.rent from rent_company inner join room_rent on rent_company.room_id = room_rent.room_id  where comp_id = ? and status = ?");
				p.setInt(1,id);
				p.setString(2,"Not Paid");
				ResultSet 	rs	=	p.executeQuery();
				while(rs.next())
				{
					rm 			=	new RentModel();
					rm.setRent_id(rs.getInt(1));
					rm.setComp_id(rs.getInt(2));
					rm.setRoom_id(rs.getInt(3));
					rm.setDue_date(rs.getDate(4));
					rm.setPaid_status(rs.getString(5));
					rm.setPaid_date(rs.getDate(6));
					rm.setAmount(rs.getFloat(8));
					arr.add(rm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return arr;
		}
		
		//..................Pay Rent............................//
		public int PayRent(int rnId,float amount)
		{
			int 		a		=	0;
			java.util.Date nwd 	= new java.util.Date();
		    java.sql.Date now 	= new java.sql.Date(nwd.getTime());
			try
			{
				p				=	con.prepareStatement("update rent_company set paid_on = ? ,status= 'Paid',amount=? where id =?");
				p.setDate(1, now);
				p.setInt(3,rnId);
				p.setFloat(2,amount);
				a				=	p.executeUpdate();
				System.out.print(p);
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return a;
		}
		
		//................Update new Rent Due......................//
		public void UpdateRoomRent()
		{
			RentModel rm;
			try
			{
				p						=	con.prepareStatement("SELECT rc.*,rr.rent from rent_company rc inner join room_rent rr on rc.room_id = rr.room_id WHERE DATEDIFF(CURDATE(),rc.due_date) <= 30 AND DATEDIFF(rc.due_date,CURDATE()) < 0  AND rc.id= (select MAX(id) from rent_company where comp_id=rc.comp_id) GROUP BY rc.comp_id");
				ResultSet	rs			=	p.executeQuery();
				while(rs.next())
				{
					rm					=	new RentModel();
					Calendar 	c		=	Calendar.getInstance();
					c.setTime(rs.getDate(4));
					c.add(Calendar.DATE, 30);  // number of days to add
					SimpleDateFormat ft = 	new SimpleDateFormat ("yyyy-MM-dd");
					String	newDue		=	ft.format(c.getTime());
					System.out.print(newDue);
					rm.setComp_id(rs.getInt(2));
					rm.setRoom_id(rs.getInt(3));
					rm.setDue_date(ft.parse(newDue));
					rm.setPaid_status("Not Paid");
					InsertNewDue(rm);
					
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		//......................Insert New Due......................//
		public void InsertNewDue(RentModel rm)
		{
			java.util.Date nwd 			= 	rm.getDue_date();
		    java.sql.Date newDue 		= 	new java.sql.Date(nwd.getTime());
			try
			{
				p						=	con.prepareStatement("insert into rent_company(comp_id,room_id,due_date,status) values(?,?,?,?)");
				p.setInt(1,rm.getComp_id());
				p.setInt(2,rm.getRoom_id());
				p.setDate(3,newDue);
				p.setString(4,rm.getPaid_status());
				p.executeUpdate();
				
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
}
