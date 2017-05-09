package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.LoginModel;
import com.CyberVillage.Models.UserModel;

public class UserService 
{
	Connection       con  = DbConnection.getConnection();
	PreparedStatement ps;
	
	public LoginModel LoginCheck(String username, String password) {
		LoginModel lm 	  = null;
		try {
			String sql="SELECT * FROM login WHERE username=? and password=?";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) 
			{
				lm 	     = new LoginModel();
				lm.setId(rs.getInt(1));
				lm.setUid(rs.getInt(2));
				lm.setUsername(rs.getString(3));
				lm.setPassword(rs.getString(4));
				lm.setType(rs.getInt(5));
				lm.setStatus(rs.getString(6));
			}
			if(lm.getType() == 1)
			{
				ps            = con.prepareStatement("select value from config_data where name = 'admin_name' or name = 'admin_pro_pic'");
				rs 			  = ps.executeQuery();
				rs.first();
				lm.setName(rs.getString(1));
				rs.next();
				lm.setPro_pic(rs.getString(1));
			}
			else if(lm.getType() == 2)
			{
				ps            = con.prepareStatement("select comp_name,logo from company_reg where comp_id ="+lm.getUid());
				rs 			  = ps.executeQuery();
				rs.first();
				lm.setName(rs.getString(1));
				lm.setPro_pic(rs.getString(2));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lm;
	}
	
	public int ChangePassword(LoginModel lm)
	{
		int 	a				=	0;
		try
		{
			ps					=	con.prepareStatement("update login set password = ? where id = ? and type = ?");
			ps.setString(1,lm.getPassword());
			ps.setInt(2,lm.getUid());
			ps.setInt(3,lm.getType());
			System.out.println(ps);
			a					=	ps.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return a;
	}
	
	//...................Signup.........................//
	public int Signup(UserModel um)
	{
		int  			a		=	0;
		try
		{
			ps					=	con.prepareStatement("insert into user (name,gender,dob,address,phone,email,qlfn,resume,state,dist,status) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,um.getName());
			ps.setString(2,um.getGender());
			ps.setString(3,um.getDob());
			ps.setString(4,um.getAddress());
			ps.setLong(5, um.getMobile());
			ps.setString(6,um.getEmail());
			ps.setString(7,um.getQuali());
			ps.setString(8,um.getResume());
			ps.setString(9,um.getState());
			ps.setString(10,um.getDistrict());
			ps.setString(11,"Active");
			a					=	ps.executeUpdate();
			if(a > 0)
			{
				int reg_id	=	0;
				ResultSet rs=	ps.getGeneratedKeys();
				if(rs.next())
				{
					reg_id=rs.getInt(1);
				}
				ps			=	con.prepareStatement("insert into login (id,username,password,type,status) values(?,?,?,?,?)");
				ps.setInt(1, reg_id);
				ps.setString(2,um.getEmail());
				ps.setString(3,um.getPassword());
				ps.setInt(4,3);
				ps.setString(5, "Active");
				ps.executeUpdate();
				a				=	reg_id;
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();// TODO: handle exception
		}
		return a;
	}
	
	//............................Feedback...............................//
	public int Feedback(UserModel um)
	{
		int		a				=	0;
		try
		{
			ps					=	con.prepareStatement("insert into feedback (name,email,subject,feedback) values(?,?,?,?)");
			ps.setString(1, um.getName());
			ps.setString(2, um.getEmail());
			ps.setString(3, um.getSubject());
			ps.setString(4, um.getMessage());
			a					=	ps.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();// TODO: handle exception
		}
		return	a;
	}
	
	//........................ Select Profile.................................//
	public UserModel	GetProfile(int uid)
	{
		UserModel		um		=	new UserModel();
		try
		{
			ps					=	con.prepareStatement("select * from user where user_id = ?");
			ps.setInt(1, uid);
			ResultSet	rs		=	ps.executeQuery();
			while(rs.next())
			{
				um.setU_id(rs.getInt(1));
				um.setName(rs.getString(2));
				um.setGender(rs.getString(3));
				um.setDob(rs.getString(4));
				um.setAddress(rs.getString(5));
				um.setMobile(rs.getLong(6));
				um.setEmail(rs.getString(7));
				um.setQuali(rs.getString(8));
				um.setResume(rs.getString(9));
				um.setState(rs.getString(10));
				um.setDistrict(rs.getString(11));
				um.setStatus(rs.getString(12));
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();// TODO: handle exception
		}
		return	um;
	}
	
	//..............................Profile Update............................//
	public int UpdateProfile(UserModel um)
	{
		int 	a				=	0;
		try
		{
			String sql			=	"UPDATE user SET name='"+um.getName()+"',dob='"+um.getDob()+"',address='"+
									um.getAddress()+"',phone="+um.getMobile()+",qlfn='"+um.getQuali()+"',state='"+um.getState()+"',"+
									"dist='"+um.getDistrict()+"'";
			if(um.getResume() != null)
				sql			   +=	",resume = '"+um.getResume()+"'";
			sql				   +=	" WHERE user_id="+um.getU_id();
			
			ps					=	con.prepareStatement(sql);
			a					=	ps.executeUpdate();
					
		}
		catch (Exception e)
		{
			e.printStackTrace();// TODO: handle exception
		}
		return	a;
	}
	
	//.....................Select All Users................................//
	public ArrayList<UserModel> AllUsers()
	{
		ArrayList<UserModel> 	arr 	=	new ArrayList<UserModel>();
		UserModel	um;
		try
		{
			ps 							=	con.prepareStatement("select * from user");
			ResultSet 	rs 				=	ps.executeQuery();
			while(rs.next())
			{
				um 						=	new UserModel();
				um.setU_id(rs.getInt(1));
				um.setName(rs.getString(2));
				um.setGender(rs.getString(3));
				um.setDob(rs.getString(4));
				um.setAddress(rs.getString(5));
				um.setMobile(rs.getLong(6));
				um.setEmail(rs.getString(7));
				um.setQuali(rs.getString(8));
				um.setResume(rs.getString(9));
				um.setState(rs.getString(10));
				um.setDistrict(rs.getString(11));
				um.setStatus(rs.getString(12));
				arr.add(um);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return arr;
	}
}
