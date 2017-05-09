<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%LoginModel lm =(LoginModel)session.getAttribute("COMPANY_DATA"); 
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
          <img src="Uploads/Company_Admin/<%=pic %>" class="img-circle" alt="User Image">
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
        <li class="active"><a href="CompanyHome.jsp"><i class="fa fa-home"></i> <span>Home</span></a></li>
        <li><a href="Applications.jsp"><i class="fa fa-black-tie"></i> <span>Job Applications</span></a></li>
        <li><a href="Vacancy.jsp"><i class="fa fa-tags"></i> <span>Vacancies</span></a></li>
        <li><a href="RentDue.jsp"><i class="fa fa-money"></i> <span>Rent Payment</span></a></li>
        <li><a href="Settings.jsp?who=CMP"><i class="fa fa-gears"></i> <span>Settings</span></a></li>
        
       <!-- <li class="treeview">
          <a href="javascript:"><i class="fa fa-building"></i> <span>Building</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Building.jsp"><i class="fa fa-long-arrow-right"></i>Building/Block</a></li>
            <li><a href="Floor.jsp"><i class="fa fa-long-arrow-right"></i>Floor</a></li>
            <li><a href="javascript: alert('Page Under Construction');"><i class="fa fa-long-arrow-right"></i>Room</a></li>
          </ul>
        </li> -->
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>