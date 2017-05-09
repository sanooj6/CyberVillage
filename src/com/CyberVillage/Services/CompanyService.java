package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.CompanyModel;

public class CompanyService 
{
		Connection 		con		=	DbConnection.getConnection();
		PreparedStatement	p;
		
		public int Insert(CompanyModel cm)
		{
			int 		a		=	0;
			try
			{
				p				=	con.prepareStatement("insert into company_reg (comp_name,manager_name,headoffice_address,type,email,phone,website,status,logo) values(?,?,?,?,?,?,?,?,?)");
				p.setString(1,cm.getComp_name());
				p.setString(2,cm.getMng_name());
				p.setString(3,cm.getAddress());
				p.setString(4,cm.getIndustry());
				p.setString(5,cm.getEmail());
				p.setLong(6, cm.getMobile());
				p.setString(7,cm.getWebsite());
				p.setString(8,"Not Approved");
				p.setString(9, cm.getLogo());
				a				=	p.executeUpdate();
				if(a > 0)
				{
					int reg_id	=	0;
					ResultSet rs=	p.getGeneratedKeys();
					if(rs.next())
					{
						reg_id=rs.getInt(1);
					}
					p			=	con.prepareStatement("insert into login (id,username,password,type,status) values(?,?,?,?,?)");
					p.setInt(1, reg_id);
					p.setString(2,cm.getEmail());
					p.setString(3,cm.getPassword());
					p.setInt(4,2);
					p.setString(5, "Inactive");
					p.executeUpdate();
					a				=	reg_id;
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return a;
		}
		
		//................Fix Room.........................//
		public int FixRoom(int cmp_id ,int room_id)
		{
			int 		a				=	0;
			try
			{
				p						=	con.prepareStatement("update company_reg set room_id = ? where comp_id = ?");
				p.setInt(1, room_id);
				p.setInt(2, cmp_id);
				a						=	p.executeUpdate();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return a;
		}
		
		//..................Select All Company.......................//
		public ArrayList<CompanyModel>AllCompany()
		{
			ArrayList<CompanyModel>	arr	=	new ArrayList<CompanyModel>();
			CompanyModel	cm;
			try
			{
				p						=	con.prepareStatement("select c.*,f.floor_name,b.buil_name,r.room_name from company_reg c inner join room r on c.room_id=r.room_id inner join floor f on r.floor_id = f.floor_id inner join building b on f.buil_id = b.buil_id");
				ResultSet 	rs			=	p.executeQuery();
				while(rs.next())
				{
					cm					=	new CompanyModel();
					cm.setComp_id(rs.getInt(1));
					cm.setComp_name(rs.getString(2));
					cm.setMng_name(rs.getString(3));
					cm.setAddress(rs.getString(4));
					cm.setIndustry(rs.getString(5));
					cm.setEmail(rs.getString(6));
					cm.setMobile(rs.getLong(7));
					cm.setWebsite(rs.getString(8));
					cm.setStatus(rs.getString(9));
					cm.setLogo(rs.getString(10));
					cm.setRoom_id(rs.getInt(11));
					cm.setFloor_name(rs.getString(12));
					cm.setBuil_name(rs.getString(13));
					cm.setRoom_name(rs.getString(14));
					arr.add(cm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();// TODO: handle exception
			}
			return arr;
			
		}
		
		//...............Change Status.........................//
		public int ChangeStatus(int id,String status)
		{
			int   k = 0;
			try {
				p 	=	con.prepareStatement("update login set status = ? where id = ? and type = '2'");
				p.setString(1, status);
				p.setInt(2,id);
				k 	=	p.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return k;
		}
		
		
}
