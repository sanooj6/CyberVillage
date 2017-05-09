package com.CyberVillage.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.UserModel;
import com.CyberVillage.Services.CommonService;
import com.CyberVillage.Services.UserService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		MultipartRequest m 		= 	null;
		String	op				=	"";
		String Path 			=	request.getServletContext().getRealPath("/");
		Path 					=	Path.substring(0,Path.indexOf("."));
		Path					=	Path.replace("\\", "/");
		String BasePath			=	request.getContextPath();
		BasePath 				=	BasePath.replace("/", "");
		String FullPath 		=	Path+BasePath+"/WebContent/Uploads/Resumes/"; 
		
		UserService 	us		=	new UserService();
		UserModel 		um		=	new UserModel();
		CommonService	cs		=	new CommonService();
		if(request.getContentType().contains("multipart/form-data"))
		{
			m					=	new MultipartRequest(request,FullPath,5242880,encoding,new DefaultFileRenamePolicy());
			op 					=	m.getParameter("op");
		}else{
			op 					=	request.getParameter("op");
		}
		
		if(op.equals("Submit"))
		{
			um.setName(m.getParameter("name"));
			um.setGender(m.getParameter("gender"));
			um.setDob(m.getParameter("dob"));
			um.setAddress(m.getParameter("addrs"));
			um.setDistrict(m.getParameter("dist"));
			um.setState(m.getParameter("state"));
			um.setQuali(m.getParameter("quali"));
			um.setResume(m.getFilesystemName("resume"));
			um.setEmail(m.getParameter("email"));
			um.setMobile(Long.parseLong(m.getParameter("mobile")));
			um.setPassword(m.getParameter("password"));
			int 	a			=	us.Signup(um);
			if(a > 0)
				response.getWriter().write( "success");
			else
				response.getWriter().write("failed");
		}
		else if(op.equals("Send"))
		{
			um					=	new UserModel();
			um.setName(request.getParameter("name"));
			um.setEmail(request.getParameter("email"));
			um.setSubject(request.getParameter("subject"));
			um.setMessage(request.getParameter("message"));
			int 	a			=	us.Feedback(um);
			if(a > 0)
				response.getWriter().write( "success");
			else
				response.getWriter().write("failed");
		}
		else if(op.equals("Update"))
		{
			um.setName(m.getParameter("name"));
			um.setDob(m.getParameter("dob"));
			um.setAddress(m.getParameter("addrs"));
			um.setDistrict(m.getParameter("dist"));
			um.setState(m.getParameter("state"));
			um.setQuali(m.getParameter("quali"));
			um.setResume(m.getFilesystemName("resume"));
			um.setEmail(m.getParameter("email"));
			um.setMobile(Long.parseLong(m.getParameter("mobile")));
			um.setU_id(Integer.parseInt(m.getParameter("U_ID")));
			int 	a			=	us.UpdateProfile(um);
			if(a > 0)
				response.getWriter().write( "success");
			else
				response.getWriter().write("failed");
		}
		 else if(op.equals("ChangeStatus"))
		  {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				String status   = 	request.getParameter("status");
				int a  			=	cs.ChangeStatus(id, status,"user","user_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		  }
	}

}
