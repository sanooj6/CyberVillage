package com.CyberVillage.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.FloorModel;
import com.CyberVillage.Services.CommonService;
import com.CyberVillage.Services.FloorService;
import com.google.gson.Gson;

/**
 * Servlet implementation class FloorServlet
 */
@WebServlet("/FloorServlet")
public class FloorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FloorServlet() {
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
		FloorModel 			fm	=	new FloorModel();
		FloorService		fs	=	new FloorService();
		CommonService		cs	=	new CommonService();
		String 				op	=	request.getParameter("op");
		
		if(op.equals("Save"))
		{
			fm.setFloor_name(request.getParameter("floor"));
			fm.setBuil_id(Integer.parseInt(request.getParameter("building")));
			fm.setDescr(request.getParameter("description"));
			fm.setRent(Float.parseFloat(request.getParameter("rent")));
			int 			a 	=	fs.FloorInsert(fm);
			if(a==1)
				response.getWriter().write( "success");
			else
				response.getWriter().write("failed");
		}
		else if(op.equals("Delete"))
		{
			int id 			=	Integer.parseInt(request.getParameter("id"));
			int a  			=	cs.Delete(id,"floor","floor_id");
			if(a==1)
				response.getWriter().write("success");
			else
					response.getWriter().write("failed");
		}
	   else if(op.equals("ChangeStatus"))
	   {
			int id 			=	Integer.parseInt(request.getParameter("id"));
			String status   = 	request.getParameter("status");
			int a  			=	cs.ChangeStatus(id, status,"floor","floor_id");
			if(a==1)
				response.getWriter().write("success");
			else
				response.getWriter().write("failed");
	   }
	   else if(op.equals("Edit"))
	   {
			int id 			=	Integer.parseInt(request.getParameter("id"));
			fm 				=	fs.SelectById(id);
			String json 	= 	new Gson().toJson(fm);
			response.getWriter().write(json);
	   }
	   else if(op.equals("Update"))
	   {
		   	fm.setFloor_name(request.getParameter("floor"));
			fm.setBuil_id(Integer.parseInt(request.getParameter("building")));
			fm.setDescr(request.getParameter("description"));
			fm.setFloor_id(Integer.parseInt(request.getParameter("id")));
			fm.setRent(Float.parseFloat(request.getParameter("rent")));
			int 		a 	=	fs.FloorUpdate(fm);
			if(a==1)
				response.getWriter().write( "success");
			else
				response.getWriter().write("failed");
	   }
	}

}
