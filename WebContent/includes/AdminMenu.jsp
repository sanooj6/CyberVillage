<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%LoginModel lm =(LoginModel)session.getAttribute("ADMIN_DATA"); 
	String name="",pic="";
 if(null == lm)
 	response.sendRedirect("../AdminLogin.jsp");
 else{
	 name  = lm.getName();
	 pic   = lm.getPro_pic();
 }%>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="Uploads/Admin_Pics/<%=pic %>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=name %></p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="AdminHome.jsp"><i class="fa fa-home"></i> <span>Home</span></a></li>
       <!--  <li><a href="Form.jsp"><i class="fa fa-link"></i> <span>Form</span></a></li>
        <li><a href="List.jsp"><i class="fa fa-link"></i> <span>List</span></a></li> -->
        
       <li class="treeview">
          <a href="javascript:"><i class="fa fa-building"></i> <span>Building</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Building.jsp"><i class="fa fa-long-arrow-right"></i>Building/Block</a></li>
            <li><a href="Floor.jsp"><i class="fa fa-long-arrow-right"></i>Floor</a></li>
            <li><a href="Room.jsp"><i class="fa fa-long-arrow-right"></i>Room</a></li>
          </ul>
        </li>
        <li><a href="Company.jsp"><i class="fa fa-industry"></i> <span>Company</span></a></li>
        <li><a href="Users.jsp"><i class="fa  fa-users"></i> <span>Users</span></a></li>
        <li><a href="RentCollection.jsp"><i class="fa fa-money"></i> <span>Rent Collections</span></a></li>
        <li><a href="Settings.jsp?who=ADM"><i class="fa fa-gears"></i> <span>Settings</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>