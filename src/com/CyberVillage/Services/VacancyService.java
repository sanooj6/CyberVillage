package com.CyberVillage.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.CyberVillage.Connection.DbConnection;
import com.CyberVillage.Models.VacancyModel;

public class VacancyService 
{
	Connection			con		=	DbConnection.getConnection();
	PreparedStatement	p;
	
	public int VacancyInsert(VacancyModel vm) 
	{
		int 	result				=	0;
		java.util.Date now			=	new Date();
		java.util.Date nwd 			= 	vm.getDate();
	    java.sql.Date newDt 		= 	new java.sql.Date(nwd.getTime());
	    java.sql.Date nowDt 		=	new java.sql.Date(now.getTime());
		try
		{
			p=con.prepareStatement("insert into vaccancy(comp_id,post,qlfn_id,percentage,dept_id,salary,tot_vacancy,doi,status,posted_on,description,type) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			p.setInt(1, vm.getComp_id());
			p.setString(2, vm.getPost());
			p.setString(3, vm.getQlfn_id());
			p.setInt(4, vm.getPercentage());
			p.setString(5, vm.getDept_id());
			p.setString(6, vm.getSalary());
			p.setInt(7, vm.getTotal());
			p.setDate(8, newDt);
			p.setString(9,"Active");
			p.setDate(10,nowDt);
			p.setString(11, vm.getDescription());
			p.setString(12, vm.getType());	
			result					=	p.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	//........................................Select All Vacancies by comp id.......................................
	
	
		public ArrayList<VacancyModel> selectAllVacanciesByComp_id(int id)
		{
			VacancyModel vm;
			ArrayList<VacancyModel> arr=new ArrayList<VacancyModel>();
			try
			{
				p=con.prepareStatement("SELECT vaccancy.*,company_reg.comp_name,company_reg.logo FROM vaccancy INNER JOIN company_reg ON vaccancy.comp_id=company_reg.comp_id WHERE company_reg.comp_id=?");
				p.setInt(1, id);
				ResultSet rs=p.executeQuery();
				while(rs.next())
				{
					vm=new VacancyModel();
					vm.setVac_id(rs.getInt(1));
					vm.setComp_id(rs.getInt(2));
					vm.setPost(rs.getString(3));
					vm.setQlfn(rs.getString(4));
					vm.setPercentage(rs.getInt(5));
					vm.setDept(rs.getString(6));
					vm.setSalary(rs.getString(7));
					vm.setTotal(rs.getInt(8));
					vm.setDate(rs.getDate(9));
					vm.setStatus(rs.getString(10));
					vm.setPosted_on(rs.getDate(11));
					vm.setDescription(rs.getString(12));
					vm.setType(rs.getString(13));
					vm.setComp_name(rs.getString(14));
					vm.setC_logo(rs.getString(15));
					
					arr.add(vm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return arr;
		}
		
		//........................................Select All Vacancies.......................................
		
		
		public ArrayList<VacancyModel> selectAllVacancies()
		{
			VacancyModel vm;
			ArrayList<VacancyModel> arr=new ArrayList<VacancyModel>();
			try
			{
				p=con.prepareStatement("SELECT vaccancy.*,company_reg.comp_name,company_reg.logo FROM vaccancy INNER JOIN company_reg ON vaccancy.comp_id=company_reg.comp_id WHERE vaccancy.doi > CURDATE()");
				ResultSet rs=p.executeQuery();
				while(rs.next())
				{
					vm=new VacancyModel();
					vm.setVac_id(rs.getInt(1));
					vm.setComp_id(rs.getInt(2));
					vm.setPost(rs.getString(3));
					vm.setQlfn(rs.getString(4));
					vm.setPercentage(rs.getInt(5));
					vm.setDept(rs.getString(6));
					vm.setSalary(rs.getString(7));
					vm.setTotal(rs.getInt(8));
					vm.setDate(rs.getDate(9));
					vm.setStatus(rs.getString(10));
					vm.setPosted_on(rs.getDate(11));
					vm.setDescription(rs.getString(12));
					vm.setType(rs.getString(13));
					vm.setComp_name(rs.getString(14));
					vm.setC_logo(rs.getString(15));
					
					arr.add(vm);
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return arr;
		}
		
		//.................Select by id...........................//
		public VacancyModel SelectById(int id)
		{
			VacancyModel vm		=	new VacancyModel();
			try
			{
				p=con.prepareStatement("SELECT vaccancy.*,company_reg.comp_name,company_reg.logo FROM vaccancy INNER JOIN company_reg ON vaccancy.comp_id=company_reg.comp_id WHERE vaccancy.vac_id = ?");
				p.setInt(1, id);
				ResultSet rs=p.executeQuery();
				while(rs.next())
				{
					vm.setVac_id(rs.getInt(1));
					vm.setComp_id(rs.getInt(2));
					vm.setPost(rs.getString(3));
					vm.setQlfn(rs.getString(4));
					vm.setPercentage(rs.getInt(5));
					vm.setDept(rs.getString(6));
					vm.setSalary(rs.getString(7));
					vm.setTotal(rs.getInt(8));
					vm.setDate(rs.getDate(9));
					vm.setStatus(rs.getString(10));
					vm.setPosted_on(rs.getDate(11));
					vm.setDescription(rs.getString(12));
					vm.setType(rs.getString(13));
					vm.setComp_name(rs.getString(14));
					vm.setC_logo(rs.getString(15));
					System.out.print(vm.getDate());
					
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return vm;
		}
		
	//...................Vacancy Update.................................//
		public int VacancyUpdate(VacancyModel vm) 
		{
			int 	result				=	0;
			java.util.Date nwd 			= 	vm.getDate();
		    java.sql.Date newDt 		= 	new java.sql.Date(nwd.getTime());
			try
			{
				p=con.prepareStatement("update vaccancy set doi=?,post=?,qlfn_id=?,percentage=?,dept_id=?,salary=?,tot_vacancy=?,description=?,type=? where vac_id = ?");
				p.setDate(1,newDt);
				p.setString(2, vm.getPost());
				p.setString(3, vm.getQlfn_id());
				p.setInt(4, vm.getPercentage());
				p.setString(5, vm.getDept_id());
				p.setString(6, vm.getSalary());
				p.setInt(7, vm.getTotal());
				p.setString(8, vm.getDescription());
				p.setString(9, vm.getType());
				p.setInt(10,vm.getVac_id());
				result					=	p.executeUpdate();
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return result;
		}
		
		
		//.....................Apply for Job.....................//
		public int Apply(int uid,int vid)
		{
			int 		a		=	0;
			try
			{
				p				=	con.prepareStatement("insert into application (user_id,vac_id,status) values(?,?,?)");
				p.setInt(1, uid);
				p.setInt(2, vid);
				p.setString(3, "Pending");
				a				=	p.executeUpdate();
			}
			catch (Exception e) 
			{
				e.printStackTrace();// TODO: handle exception
			}
			return a;
		}
		
		//......................Get Job Applications By Company .....................//
		public ArrayList<VacancyModel> GetApplications (int comp_id)
		{
			ArrayList<VacancyModel> arr	=	new ArrayList<>();
			VacancyModel	vm;
			try
			{
				p						=	con.prepareStatement("select ap.*,us.name,us.gender,us.address,us.phone,us.email,us.qlfn,us.state,us.dist,us.resume,v.post,v.type,v.salary,v.doi,v.tot_vacancy,v.dept_id"+
											" , c.comp_name from application ap inner join user us on ap.user_id=us.user_id inner join vaccancy v on ap.vac_id=v.vac_id inner join company_reg c on c.comp_id = v.comp_id where v.comp_id = ? order by ap.status desc");		
				p.setInt(1, comp_id);
				ResultSet	rs			=	p.executeQuery();
				while(rs.next())
				{
					vm					=	new VacancyModel();
					vm.setApp_id(rs.getInt(1));
					vm.setUser_id(rs.getInt(2));
					vm.setVac_id(rs.getInt(3));
					vm.setStatus(rs.getString(4));
					vm.setName(rs.getString(5));
					vm.setGnder(rs.getString(6));
					vm.setAddrs(rs.getString(7));
					vm.setPhone(rs.getLong(8));
					vm.setEmail(rs.getString(9));
					vm.setQlfn(rs.getString(10));
					vm.setState(rs.getString(11));
					vm.setDist(rs.getString(12));
					vm.setResume(rs.getString(13));
					vm.setPost(rs.getString(14));
					vm.setType(rs.getString(15));
					vm.setSalary(rs.getString(16));
					vm.setDate(rs.getDate(17));
					vm.setTotal(rs.getInt(18));
					vm.setDept(rs.getString(19));
					vm.setComp_name(rs.getString(20));
					arr.add(vm);
					
				}
			}
			catch (Exception e) 
			{
				e.printStackTrace();// TODO: handle exception
			}
			return arr;
			
		}
		
}
