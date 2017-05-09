<%@page import="com.CyberVillage.Models.UserModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.UserService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/AdminHeader.jsp"></jsp:include>
<jsp:include page="includes/AdminMenu.jsp"></jsp:include>
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("ADMIN_DATA");
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp"); %>
 
 <style>
 .form-horizontal .control-label {text-align: left;}
 </style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Users <small>Information about Users</small> </h1>
      <ol class="breadcrumb">
        <li><a href="AdminHome.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Users</li>
      </ol>
    </section>
     <!-- Main content -->
    <section class="content">
     <% 
    	 UserService us				=	new UserService();
		 ArrayList<UserModel>arr 	= 	us.AllUsers();
	  %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">User List</h3>
             </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="UsrTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Qualification</th>
                    <th>District</th>
                    <th>State</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <% for(UserModel um:arr){%>
                  <tr>
                      <td><%=um.getU_id() %></td>
                      <td><%=um.getName() %></td>
                      <td><%=um.getGender()%></td>
                      <td><%=um.getAddress() %></td>
                      <td><%=um.getMobile() %></td>
                      <td><%=um.getEmail() %></td>
                      <td><%=um.getQuali() %></td>
                      <td><%=um.getDistrict() %></td>
                      <td><%=um.getState() %></td>
				      <td><%=um.getStatus() %></td>
				      
                    <td> 
                    	<% if(um.getStatus().equals("Active")){ %>
                    	<a href="javascript:" title="Disable" class="btn btn-danger btn-xs" onclick="ChangeStatus(<%=um.getU_id()%>,'UserServlet','Inactive');">
                    		<i class="fa fa-ban"></i>
                    	</a>
                    	<%}else{ %>
                    	<a href="javascript:" title="Enable" class="btn btn-success btn-xs" onclick="ChangeStatus(<%=um.getU_id()%>,'UserServlet','Active');">
                    		<i class="fa fa-check"></i>
                    	</a>
                    	<%}%>
                   	</td>
                  </tr>
              <%} %>
                 </tbody>
              </table>
            </div>
            <!-- /.box-body --> 
          </div>
          <!-- /.box --> 
        </div>
        <!-- /.col --> 
      </div>
      <!-- /.row --> 
    </section>
    <!-- /.content --> 
    
  </div>
  <!-- /.content-wrapper -->
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>