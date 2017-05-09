package com.CyberVillage.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.RentModel;
import com.CyberVillage.Services.RentService;

/**
 * Servlet implementation class RentServlet
 */
@WebServlet("/RentServlet")
public class RentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentServlet() {
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
			RentModel 		rnm			=	new RentModel();
			RentService		rns			=	new RentService();
			String 			op			=	request.getParameter("op");
			
			if(op.equals("Pay"))
			{
				int 		rnId		=	Integer.parseInt(request.getParameter("rid"));
				float		amount		=	Float.parseFloat(request.getParameter("amt"));
				int 		a			=	rns.PayRent(rnId,amount);
				if(a==1)
					response.getWriter().write("success");
				else
						response.getWriter().write("failed");
			}
	}

}
