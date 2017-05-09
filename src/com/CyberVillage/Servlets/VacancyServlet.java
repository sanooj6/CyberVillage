package com.CyberVillage.Servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CyberVillage.Models.LoginModel;
import com.CyberVillage.Models.RentModel;
import com.CyberVillage.Models.VacancyModel;
import com.CyberVillage.Services.CommonService;
import com.CyberVillage.Services.RentService;
import com.CyberVillage.Services.VacancyService;
import com.google.gson.Gson;

/**
 * Servlet implementation class VacancyServlet
 */
@WebServlet("/VacancyServlet")
public class VacancyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VacancyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 	VacancyModel	vm		=	new VacancyModel();
		 	VacancyService	vs		=	new VacancyService();
		 	CommonService 	cs		=	new CommonService();
		 	HttpSession		session	=	request.getSession();
		 	String 			op		=	request.getParameter("op");
		 	LoginModel		lm		=	(LoginModel)session.getAttribute("COMPANY_DATA");
		 	DateFormat format 		= 	new SimpleDateFormat("yyyy-MM-dd");
		 	if(op.equals("Save"))
		 	{
		 		vm.setComp_id(lm.getUid());
		 		vm.setPost(request.getParameter("desig"));
		 		vm.setDept_id(request.getParameter("dept"));
		 		vm.setQlfn_id(request.getParameter("quali"));
		 		vm.setSalary(request.getParameter("salary"));
		 		vm.setTotal(Integer.parseInt(request.getParameter("total")));
		 		try {
					vm.setDate(format.parse(request.getParameter("dateIn")));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 		vm.setDescription(request.getParameter("description"));
		 		vm.setType(request.getParameter("type"));
		 		int a =vs.VacancyInsert(vm);
		 		if(a==1)
					response.getWriter().write( "success");
				else
					response.getWriter().write("failed");
		 	}
		 	else if(op.equals("Delete"))
		 	{
				int id 			=	Integer.parseInt(request.getParameter("id"));
				int a  			=	cs.Delete(id,"vaccancy","vac_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		 	}
		 	else if(op.equals("ChangeStatus"))
			{
				int id 			=	Integer.parseInt(request.getParameter("id"));
				String status   = 	request.getParameter("status");
				int a  			=	cs.ChangeStatus(id, status,"vaccancy","vac_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
			}
		 	else if(op.equals("Edit"))
			{
				int id 			=	Integer.parseInt(request.getParameter("id"));
				vm 				=	vs.SelectById(id);
				vm.setDist(vm.getDate().toString());
				String json 	= 	new Gson().toJson(vm);
				response.getWriter().write(json);
			}
		 	else if(op.equals("Update"))
			{
		 		vm.setPost(request.getParameter("desig"));
		 		vm.setDept_id(request.getParameter("dept"));
		 		vm.setQlfn_id(request.getParameter("quali"));
		 		vm.setSalary(request.getParameter("salary"));
		 		vm.setTotal(Integer.parseInt(request.getParameter("total")));
		 		vm.setDescription(request.getParameter("description"));
		 		vm.setType(request.getParameter("type"));
		 		try {
					vm.setDate(format.parse(request.getParameter("dateIn")));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 		vm.setVac_id(Integer.parseInt(request.getParameter("id")));
				int 		a 	=	vs.VacancyUpdate(vm);
				if(a==1)
					response.getWriter().write( "success");
				else
					response.getWriter().write("failed");
		    }
		 	else if(op.equals("Apply"))
		 	{
		 		int uid 	=	Integer.parseInt(request.getParameter("uid"));
		 		int vid		=	Integer.parseInt(request.getParameter("vac_id"));
		 		int a  		=	vs.Apply(uid, vid);	
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		 	}
		 	else if(op.equals("Invite"))
		 	{
		 		int app_id	=	Integer.parseInt(request.getParameter("app_id"));
		 		String vac	=	request.getParameter("vac");
		 		String email=	request.getParameter("email");
		 		String date	=	request.getParameter("date");
		 		String name	=	request.getParameter("name");
		 		String comp	=	request.getParameter("comp");
		 		String msg	=	"Hi "+name+", <br> Your job application for '"+vac+"'"+
						" has been approved by "+comp+" Admin <br> You are invited to attend an interview on "+date+" , <br>"+
						" be available on the date <br> Thanks & Regards <br> "+comp+" Admin";
		 		int a  		=	cs.ChangeStatus(app_id, "Invited","application","sl_no");
		 		if(a==1)
				{
					cs.sendMail(comp+"@admin.com", email,"Invitation for interview", msg);
					response.getWriter().write("success");
				}
		 		else
					response.getWriter().write("failed");
		 	}
	}

}
