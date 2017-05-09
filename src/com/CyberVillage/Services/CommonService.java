package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.omg.CORBA.NameValuePair;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.CommonModel;
import com.CyberVillage.Models.RentModel;

public class CommonService 
{
	Connection 	con 			=	DbConnection.getConnection();
	PreparedStatement p;
	
	//.........................Delete by id...............................//
	public int Delete(int id,String table,String field)
	{
		int   k = 0;
		try {
			p 	=	con.prepareStatement("delete from "+table+" where "+field+" = ?");
			p.setInt(1,id);
			k 	=	p.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	//.........................Change Status...............................//
	public int ChangeStatus(int id,String status,String table,String field)
	{
		int   k = 0;
		try {
			p 	=	con.prepareStatement("update "+table+" set status = ? where "+field+" = ?");
			p.setString(1, status);
			p.setInt(2,id);
			k 	=	p.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
	
	//.................................Send Mail..............................//
	   public int sendMail(String from,String to,String subject,String msg) 
	   {
		   	final String userName ="project.demoreply@gmail.com"; //PUT YOUR EMAIL ID HERE
		    final String password="projectsdemos";  // YOUR PASSWORD
			 try
		     {
				 Properties properties = new Properties();
		         properties.put("mail.smtp.host", "smtp.gmail.com");
		         properties.put("mail.smtp.port", "587");
		         properties.put("mail.smtp.starttls.enable", "true") ;
		         properties.put("mail.smtp.auth", "true") ;

		         Session session = Session.getInstance(properties,new Authenticator() {
		            protected PasswordAuthentication getPasswordAuthentication(){
		                return new PasswordAuthentication(userName, password);
		            }
		         });
		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress(from));
	            message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));
	            message.setSubject(subject);
	            message.setContent(msg,"text/html;     charset=utf-8");
	            Transport.send(message);
		     }
			 catch (Exception e) 
			 {
				e.printStackTrace();
				return 3;
			 }
			 return 1;
	   }
	   
	   
	   //........................All Statistics...........................//
	   public CommonModel TotalStatistics()
	   {
		   CommonModel 	cm				=	new CommonModel();
		   String 	sql					=	"SELECT (select COUNT(*) from company_reg) AS TotalC,"+
										      " (select COUNT(*) from company_reg where status = 'Active') AS ActiveC,"+
											  " (select COUNT(*) from user) AS TotalU,"+
											  " (select COUNT(*) from user where status = 'Active') AS ActiveU,"+
											  " (select COUNT(*) from vaccancy) AS TotalV,"+
										      " (select COUNT(*) from vaccancy where status = 'Active') AS ActiveV,"+
											  " (select COUNT(*) from building) AS TotalB,"+
										      " (select COUNT(*) from building where status = 'Active') AS ActiveB,"+
											  " (select COUNT(*) from floor) AS TotalF,"+
										      " (select COUNT(*) from floor where status = 'Active') AS ActiveF,"+
											  " (select COUNT(*) from room) AS TotalR,"+
										      " (select COUNT(*) from room where status = 'Active') AS ActiveR,"+
											  " (select COUNT(*) from rent_company where status = 'Not Paid') AS RentP,"+
										      " (select COUNT(*) from room where occupied != 0) as Oroom ,"+
											  " (select COUNT(*) from company_reg where status = 'Not Approved') AS AproveC";
		  try
		  {
			  	p						=	con.prepareStatement(sql);
			  	System.out.print(p);
			  	ResultSet	rs			=	p.executeQuery();
			  	while(rs.next())
			  	{
			  		cm.setTotal_comp(rs.getInt(1));
			  		cm.setActive_comp(rs.getInt(2));
			  		cm.setTotal_users(rs.getInt(3));
			  		cm.setActive_users(rs.getInt(4));
			  		cm.setTotal_vacancy(rs.getInt(5));
			  		cm.setActive_vacancy(rs.getInt(6));
			  		cm.setTotal_building(rs.getInt(7));
			  		cm.setActive_building(rs.getInt(8));
			  		cm.setTotal_floor(rs.getInt(9));
			  		cm.setActive_floor(rs.getInt(10));
			  		cm.setTotal_room(rs.getInt(11));
			  		cm.setActive_room(rs.getInt(12));
			  		cm.setPending_rent(rs.getInt(13));
			  		cm.setOccupied_room(rs.getInt(14));
			  		cm.setApprove_comp(rs.getInt(15));
			  	}
		  }
		  catch (Exception e)
		  {
			  e.printStackTrace();// TODO: handle exception
		  }
		   return cm;
	   }
	   
	   //..................Company Statistics....................//
	   public CommonModel CompanyStatistics(int id)
	   {
		   CommonModel		cm		=	new CommonModel();
		   try
		   {
			   p					=	con.prepareStatement("select count(v.vac_id) , count( case when v.status ='Active' then 1 END) as active from company_reg c inner join vaccancy v  on c.comp_id = v.comp_id where c.comp_id = ?");
			   p.setInt(1, id);
			   ResultSet rs			=	p.executeQuery();
			   if(rs.next())
			   {
				   cm.setTotal_vacancy(rs.getInt(1));
			   	   cm.setActive_vacancy(rs.getInt(2));
			   }
				  
			   p					=	con.prepareStatement("select count(ap.sl_no) , count( case when ap.status ='Pending' then 1 END) as pending from application ap  inner join vaccancy v on ap.vac_id = v.vac_id inner join company_reg c  on c.comp_id = v.comp_id where c.comp_id = ?");
			   p.setInt(1, id);
			   rs					=	p.executeQuery(); 
			   if(rs.next())
			   {
				   cm.setTotal_application(rs.getInt(1));
				   cm.setPending_application(rs.getInt(2));
				   cm.setInvited_application(cm.getTotal_application()-cm.getPending_application());
			   }
		   }
		   catch (Exception e)
		   {
			   e.printStackTrace();// TODO: handle exception
		   }
		   return cm;
	   }
	   
	   //.....................Select pending Rent.....................//
	   public ArrayList<RentModel>PendingRent()
	   {
		   ArrayList<RentModel> arr		= new ArrayList<RentModel>();
		   RentModel  rm;
		   try
		   {
			   	p						=	con.prepareStatement("select r.due_date,c.comp_name,rr.rent,DATEDIFF(r.due_date,CURDATE()) as days from rent_company r inner join company_reg c on c.comp_id = r.comp_id inner join room_rent rr on r.room_id = rr.room_id where r.status = 'Not Paid'");
			   	ResultSet	rs			=	p.executeQuery();
			   	while(rs.next())
			   	{
			   		rm					=	new RentModel();
			   		rm.setDue_date(rs.getDate(1));
			   		rm.setComp_name(rs.getString(2));
			   		rm.setAmount(rs.getFloat(3));
			   		rm.setDays(rs.getInt(4));
			   		arr.add(rm);
			   	}
		   }
		   catch (Exception e)
		   {
			   e.printStackTrace();// TODO: handle exception
		}
		   return arr;
	   }
	   
	   //...............................Rent Statistics...................//
	   public ArrayList<RentModel> RentStatistics()
	   {
		   ArrayList<RentModel> 	arr	=	new ArrayList<RentModel>();
		   RentModel	rm;
		   try
		   {
			   p						=	con.prepareStatement("select MONTHNAME(due_date),sum(amount) from rent_company where status = 'Paid' GROUP BY  MONTH(due_date) order by due_date asc");
			   ResultSet	rs			=	p.executeQuery();
			   while(rs.next())
			   {
				   rm					=	new RentModel();
				   rm.setB_name(rs.getString(1));
				   rm.setAmount(rs.getFloat(2));
				   arr.add(rm);
			   }
		   }
		   catch (Exception e)
		   {
			   e.printStackTrace();// TODO: handle exception
		}
		   return arr;
	   }
}
