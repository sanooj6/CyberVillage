package com.CyberVillage.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.BuildingModel;
import com.CyberVillage.Services.BuildingService;
import com.CyberVillage.Services.CommonService;
import com.google.gson.Gson;

/**
 * Servlet implementatioclass BuildingServlet
 */
@WebServlet("/BuildingServlet")
public class BuildingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuildingServlet() {
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
		  BuildingModel    bm = new BuildingModel();
		  BuildingService  bs = new BuildingService();
		  CommonService    cs = new CommonService();
		  String           op = request.getParameter("op");
		  
		  if(op.equals("Save"))
		  {
			  bm.setBuil_name(request.getParameter("b_name"));
			  bm.setBuil_type(request.getParameter("b_type"));
			  bm.setBuil_descr(request.getParameter("description"));
			  if(bm.getBuil_type().equals("Lease"))
				  bm.setDuration(Integer.parseInt(request.getParameter("duration")));
			  else
				  bm.setDuration(0);
			  int a  = bs.BuildingInsert(bm);
			  if(a==1)
					response.getWriter().write( "success");
			  else
					response.getWriter().write("failed");
		  }
		  else if(op.equals("Delete"))
		  {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				int a  			=	cs.Delete(id,"building","buil_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		  }
		  else if(op.equals("ChangeStatus"))
		  {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				String status   = 	request.getParameter("status");
				int a  			=	cs.ChangeStatus(id, status,"building","buil_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		  }
		  else if(op.equals("Edit"))
		  {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				bm 				=	bs.SelectById(id);
				String json 	= 	new Gson().toJson(bm);
				response.getWriter().write(json);
				
		  }
		  if(op.equals("Update"))
		  {
			  bm.setBuil_name(request.getParameter("b_name"));
			  bm.setBuil_type(request.getParameter("b_type"));
			  bm.setBuil_descr(request.getParameter("description"));
			  bm.setBuil_id(Integer.parseInt(request.getParameter("id")));
			  if(bm.getBuil_type().equals("Lease"))
				  bm.setDuration(Integer.parseInt(request.getParameter("duration")));
			  else
				  bm.setDuration(0);
			  int a  = bs.BuildingUpdate(bm);
			  if(a==1)
					response.getWriter().write( "success");
			  else
					response.getWriter().write("failed");
		  }
	}

}
