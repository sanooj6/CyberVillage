package com.CyberVillage.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CyberVillage.Models.RoomModel;
import com.CyberVillage.Services.CommonService;
import com.CyberVillage.Services.RoomService;
import com.google.gson.Gson;

/**
 * Servlet implementation class RoomServlet
 */
@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomServlet() {
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
			RoomModel			rm	=	new RoomModel();
			RoomService 		rs	=	new RoomService();
			CommonService		cs	=	new CommonService();
			String 				op	=	request.getParameter("op");
			if(op.equals("Save"))
			{
				rm.setR_name(request.getParameter("room"));
				rm.setFloor_id(Integer.parseInt(request.getParameter("floor")));
				rm.setDoor_num(request.getParameter("door_num"));
				rm.setS_feet(Float.parseFloat(request.getParameter("s_feet")));
				int 			a 	=	rs.RoomInsert(rm);
				if(a==1)
					response.getWriter().write( "success");
				else
					response.getWriter().write("failed");
			}
			else if(op.equals("Delete"))
			{
				int id 			=	Integer.parseInt(request.getParameter("id"));
				int a  			=	cs.Delete(id,"room","room_id");
				if(a==1)
					response.getWriter().write("success");
				else
						response.getWriter().write("failed");
			}
		   else if(op.equals("ChangeStatus"))
		   {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				String status   = 	request.getParameter("status");
				int a  			=	cs.ChangeStatus(id, status,"room","room_id");
				if(a==1)
					response.getWriter().write("success");
				else
					response.getWriter().write("failed");
		   }
		   else if(op.equals("Edit"))
		   {
				int id 			=	Integer.parseInt(request.getParameter("id"));
				rm 				=	rs.SelectRoomsById(id);
				String json 	= 	new Gson().toJson(rm);
				response.getWriter().write(json);
		   }
		   if(op.equals("Update"))
		   {
				rm.setR_name(request.getParameter("room"));
				rm.setFloor_id(Integer.parseInt(request.getParameter("floor")));
				rm.setDoor_num(request.getParameter("door_num"));
				rm.setS_feet(Float.parseFloat(request.getParameter("s_feet")));
				rm.setRoom_id(Integer.parseInt(request.getParameter("id")));
				int 			a 	=	rs.RoomUpdate(rm);
				if(a==1)
					response.getWriter().write( "success");
				else
					response.getWriter().write("failed");
		   }
		   if(op.equals("GetRooms"))
		   {
			   int floor				=	Integer.parseInt(request.getParameter("floor"));
			   ArrayList<RoomModel> arr =	rs.SelectRoomsByFloor(floor);
			   String roomList 			=	"";
			   if(arr.size() == 0)
			   {
				   roomList				=	"<li class='empty'>"+
                            				"<a href='javascript:'><span class=''>No Rooms</span></a>"+
                            				"</li>";
			   }
			   else
			   {
				   String  avail		=	"available";
				   String  shdw			=	"";
				   String status		=	"";
				   int occupied			=	0;
				   float amount=0,sqft=0;
				   String door			=	"";
				   int room_id			=	0;
				   for(RoomModel mr : arr)
				   {
					   status			=	mr.getStatus();
					   occupied			=	mr.getOccupied();
					   amount			=	mr.getRent();
					   sqft				=	mr.getS_feet();
					   door				=	mr.getDoor_num();
					   room_id			=	mr.getRoom_id();
					   if(status.equals("Inactive"))
					   {
						   avail		=	"notavailable";
						   shdw			=	"";
					   }
					   else if(occupied != 0)
					   {
						   shdw			=	"";
						   avail		=	"booked";
					   }
					   else
					   {
						   avail		=	"available";
						   shdw			=	"hvr-float-shadow";
					   }
					   roomList		   +=	"<li class='"+avail+"' RmId='"+room_id+"'>"+
				                            	"<a href='javascript:' class='"+shdw+"'>"+
				                            		"<span class=''>DoorNo: "+door+"</span><br>"+
				                            		"<span>Sq.Ft: "+sqft+"</span><br>"+
				                            		"<span>Rent: "+amount+" (Rs)</span>"+
				                            	"</a>"+
				                            "</li>";
				   }
			   }
			   
			   response.getWriter().write(roomList);
		   }
	}

}
