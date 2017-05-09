package com.CyberVillage.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CyberVillage.Models.LoginModel;
import com.CyberVillage.Services.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String	op			= 	request.getParameter("op");
		UserService	us		=	new UserService();
		HttpSession session = 	request.getSession();
		
		if(op.equals("login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String type		= request.getParameter("type");
			LoginModel  lm 	=	us.LoginCheck(username, password);
			if (lm != null)
			{
				if(lm.getStatus().equals("Active"))
				{
					if(lm.getType() == 1 && type.equals("ADM"))
					{
						session.setAttribute("ADMIN_DATA", lm);
						response.getWriter().write("AdminHome.jsp");
					}
					else if(lm.getType() == 2 && type.equals("ADM"))
					{
						session.setAttribute("COMPANY_DATA", lm);
						response.getWriter().write("CompanyHome.jsp");
					}
					else if(lm.getType() == 3 && type.equals("USR"))
					{
						session.setAttribute("USER_DATA", lm);
						response.getWriter().write("Jobs.jsp");
					}
					else
						response.getWriter().write("invalid");
				}
				else
				{
					response.getWriter().write("inactive");
				}
			}
			else
			{
				response.getWriter().write("invalid");
			}
				
		}
		else if(op.equals("ChangeP"))
		{
			LoginModel 			lm 	=	new LoginModel();
			lm.setUid(Integer.parseInt(request.getParameter("id")));
			lm.setPassword(request.getParameter("pass"));
			lm.setType(Integer.parseInt(request.getParameter("type")));
			int 			a		=	us.ChangePassword(lm);
			if(a != 0){
				response.getWriter().write( "success");
				if(lm.getType() == 1)
				{
					LoginModel ll 	=	(LoginModel)session.getAttribute("ADMIN_DATA");
					ll.setPassword(lm.getPassword());
					session.setAttribute("ADMIN_DATA",ll);
				}
				else if(lm.getType() == 2)
				{
					LoginModel ll 	=	(LoginModel)session.getAttribute("COMPANY_DATA");
					ll.setPassword(lm.getPassword());
					session.setAttribute("COMPANY_DATA",ll);
				}
				else if(lm.getType() == 3)
				{
					LoginModel ll 	=	(LoginModel)session.getAttribute("USER_DATA");
					ll.setPassword(lm.getPassword());
					session.setAttribute("USER_DATA",ll);
				}
				
			}
			else 
				response.getWriter().write("failed");
		}
		else if(op.equals("logout"))
		{
			session.invalidate();
		}
	}

}
