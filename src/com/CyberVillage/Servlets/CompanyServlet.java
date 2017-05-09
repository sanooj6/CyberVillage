package com.CyberVillage.Servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.CompanyModel;
import com.CyberVillage.Models.RentModel;
import com.CyberVillage.Services.CommonService;
import com.CyberVillage.Services.CompanyService;
import com.CyberVillage.Services.RentService;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
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
			String encoding			=	"ISO-8859-1";
			CompanyService		cs	=	new CompanyService();
			CommonService		ss	=	new CommonService();
			CompanyModel		cm	=	new CompanyModel();
			MultipartRequest m 		= 	null;
			String	op				=	"";
			String Path 			=	request.getServletContext().getRealPath("/");
			Path 					=	Path.substring(0,Path.indexOf("."));
			Path					=	Path.replace("\\", "/");
			String BasePath			=	request.getContextPath();
			BasePath 				=	BasePath.replace("/", "");
			String FullPath 		=	Path+BasePath+"/WebContent/Uploads/Company_Admin/"; 
			if(request.getContentType().contains("multipart/form-data"))
			{
				m					=	new MultipartRequest(request,FullPath,5242880,encoding,new DefaultFileRenamePolicy());
				op 					=	m.getParameter("op");
			}else{
				op 					=	request.getParameter("op");
			}
			
			if(op.equals("Submit"))
			{
				cm.setComp_name(m.getParameter("comp_name"));
				cm.setMng_name(m.getParameter("mng_name"));
				cm.setAddress(m.getParameter("addrs"));
				cm.setIndustry(m.getParameter("type"));
				cm.setMobile(Long.parseLong(m.getParameter("mobile")));
				cm.setEmail(m.getParameter("email"));
				cm.setWebsite(m.getParameter("website"));
				cm.setPassword(m.getParameter("password"));
				cm.setLogo(m.getFilesystemName("logo"));
				int id				=	cs.Insert(cm);
				if(id > 0)
				{
					cm				=	new CompanyModel();
					cm.setStatus("success");
					cm.setComp_id(id);
					String json 	= 	new Gson().toJson(cm);
					response.getWriter().write(json);
				}
				else
				{
					cm				=	new CompanyModel();
					cm.setStatus("failed");
					String json 	= 	new Gson().toJson(cm);
					response.getWriter().write(json);
				}
			}
			if(op.equals("FixRoom"))
			{
					int cmp_id		=	Integer.parseInt(request.getParameter("comp_id"));
					int room_id		=	Integer.parseInt(request.getParameter("room_id"));
					int a			=	cs.FixRoom(cmp_id, room_id);
					if(a==1)
						response.getWriter().write( "success");
					else
						response.getWriter().write("failed");
			}
			else if(op.equals("ChangeStatus"))
			{
					int id 			=	Integer.parseInt(request.getParameter("id"));
					String status   = 	request.getParameter("status");
					int a  			=	ss.ChangeStatus(id, status,"company_reg","comp_id");
					if(a==1)
					{
						cs.ChangeStatus(id, status);
						response.getWriter().write("success");
					}
					else
						response.getWriter().write("failed");
			}
			else if(op.equals("Approve"))
			{
					int comp_id		=	Integer.parseInt(request.getParameter("comp_id"));
					int room_id		=	Integer.parseInt(request.getParameter("room_id"));
					String cmp_name	=	request.getParameter("cmp_name");
					String email	=	request.getParameter("email");
					String msg		=	"Hi, <br> Your company registration named '"+cmp_name+"'"+
										" has been approved by CyberPark Admin <br> You can login to your account on CyberVillage/AdminLogin.jsp <br>"+
										" and please your email id ("+email+") as username. <br> Thanks & Regards <br> CyberPark Admin";
					int a  			=	ss.ChangeStatus(comp_id, "Active","company_reg","comp_id");
					if(a==1)
					{
						cs.ChangeStatus(comp_id, "Active");
						RentModel rmr	=	new RentModel();
						RentService rsr = 	new RentService();
						Date	due		=	new Date();
						Calendar 	c	=	Calendar.getInstance();
						c.setTime(due);
						c.add(Calendar.DATE, 30);  // number of days to add
						SimpleDateFormat ft = 	new SimpleDateFormat ("yyyy-MM-dd");
						String	newDue		=	ft.format(c.getTime());
						rmr.setComp_id(comp_id);
						rmr.setRoom_id(room_id);
						try {
							rmr.setDue_date(ft.parse(newDue));
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						rmr.setPaid_status("Not Paid");
						rsr.InsertNewDue(rmr);
						ss.sendMail("CyberPark@admin.com", email,"Account Approval Mail", msg);
						response.getWriter().write("success");
					}
					else
						response.getWriter().write("failed");
					
			}

	}

}
