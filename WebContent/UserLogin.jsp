<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
 <link rel="stylesheet" href="css/loginstyle.css"> 
<!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Login Here</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>User Login</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->

     <div class="containers">
	<section id="contents">
		<form action="LoginServlet" method="post" id="LoginForm">
			<h1>Login Form</h1>
			<div>
				<input type="text" placeholder="Username"  name="username" id="username" class="validate[required, custom[email]]" />
			</div>
			<div>
				<input type="password" placeholder="Password"   name="password" id="password" class="validate[required]"/>
			</div>
			<div>
				<input type="submit" value="Log in" />
				<!-- <a href="#">Lost your password?</a> -->
				<!-- <a href="#">Register</a> -->
			</div>
			<input type="hidden" name="type" id="type" value="USR">
		</form><!-- form -->
		<div class="button">
		<a href="AdminLogin.jsp">Admin Login</a> &nbsp;<i class="fa fa-user"></i><a href="UserSignUp.jsp">User Registration</a> 
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
<script type="text/javascript">
 $('#Lmenu').addClass('active');
</script>		
<jsp:include page="Footer.jsp"></jsp:include>