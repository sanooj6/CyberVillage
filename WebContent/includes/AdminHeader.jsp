<%@page import="com.CyberVillage.Models.RentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Models.CommonModel"%>
<%@page import="com.CyberVillage.Services.CommonService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Cyber Park Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="dist/font-awesome-4.6.3//css/font-awesome.min.css">
  
  <!-- Ionicons 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
  
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="dist/css/skins/skin-black.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->

<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
  <!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="css/validationEngine.jquery.css">
  <link rel="stylesheet" href="css/sweetalert.css">
  <link rel="stylesheet" href="plugins/datepicker/jquery-ui.css">
  <script src="plugins/datepicker/jquery-ui.js"></script>
  <script type="text/javascript" src="js/sweetalert-dev.js"></script>
<script type="text/javascript" src="js/jquery.validationEngine-en.js"></script>
<script type="text/javascript" src="js/jquery.validationEngine.js"></script>

<script type="text/javascript" src="js/cyber.js"></script>
<style type="text/css">
.skin-black .main-header > .logo {background-color: #367fa9; color:#AACBED;}
.skin-black .main-header .navbar {background-color: #367fa9;}
.navbar-nav > .user-menu > .dropdown-menu > .user-footer {background-color: #374850;}
</style>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<%LoginModel lm =(LoginModel)session.getAttribute("ADMIN_DATA"); 
	String name="",pic="";
 if(null == lm)
 	response.sendRedirect("../AdminLogin.jsp");
 else{
	 name  = lm.getName();
	 pic   = lm.getPro_pic();
 }%>
 
<body class="hold-transition skin-black sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="index.php" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>C</b>Park</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Cyber</b>Park</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
       	<% CommonService ccs		=	 new CommonService();
    		CommonModel  ccm		=	 ccs.TotalStatistics();
    		ArrayList<RentModel>rrr	=	 ccs.PendingRent();
    		int PendingC 			=	 ccm.getApprove_comp();
    		int notC				=	(PendingC > 0)?1:0;
    		int PendingR			=    rrr.size();
    		notC				   +=	PendingR;
    		 %>
    		  <li class="dropdown notifications-menu">
            
            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning"><%= notC %></span>
            </a>
            <ul class="dropdown-menu">
            <% if(PendingC > 0){ %>
              <li class="header">You have <%= notC %> notification</li>
              <li>
                <ul class="menu">
                
                  <li>
                    <a href="Company.jsp">
                      <i class="fa fa-industry text-aqua"></i><b><%=PendingC %></b> New Company need approval
                    </a>
                  </li>
                <%if(PendingR > 0) {%>
                <li>
                    <a href="RentCollection.jsp">
                      <i class="fa fa-money text-aqua"></i><b><%=PendingR %></b> Rent Pendings
                    </a>
                  </li>
                <%} %>
                </ul>
              </li>
              
             
              <% }else{ %>
              <li class="footer"><a href="javascript:">No notifications</a></li>
              <% } %>
            </ul>
          </li>
        
    		 
    		 
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="Uploads/Admin_Pics/<%=pic %>" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs"><%=name %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="Uploads/Admin_Pics/<%=pic %>" class="img-circle" alt="User Image">


                <p>
                  <%=name %>
                  <small>Cyber Park Admin</small>
                </p>
              </li>
              <!-- Menu Body -->
             <!--  <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                /.row
              </li> -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                 <!--  <a href="#" class="btn btn-default btn-flat">Profile</a> -->
                </div>
                <div class="pull-right">
                  <a href="javascript:" class="btn btn-default btn-flat" id="signout" style="margin-right:80px;">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
 