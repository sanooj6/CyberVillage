<%@page import="com.CyberVillage.Models.LoginModel"%>
<jsp:include page="Header.jsp"></jsp:include>
<% 
 LoginModel lm =(LoginModel)session.getAttribute("USER_DATA");
 int Uid 		=	0;
 String	Pass	=	"";
 if(null == lm)
 	response.sendRedirect("UserLogin.jsp");
 else
 {
	 Uid 		= 	lm.getUid(); 
	 Pass		=	lm.getPassword();	
 }
	
 %>
<!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0; background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>SETTINGS</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Settings</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->

    <!-- Start Content -->
    <div id="content">
      <div class="container">
        <div class="page-content">
		<div class="row">

            <div class="col-md-6 col-md-offset-3">

              <!-- Classic Heading -->
              <h4 class="classic-title"><span>Change Your Password</span></h4>
				<form id="pswd_frm">
                    <div class="form-group">
                        <label for="">Password</label>
                         <input type="password" class="form-control validate[required]"  placeholder="Current"  name="current"  id="current">
                    </div>
                    <div class="form-group">
                        <label for="">New Password</label>
                         <input type="password" class="form-control validate[required]"  placeholder="New"  name="new"  id="new">
                    </div>
                    <div class="form-group">
                        <label for="">Confirm Password</label>
                         <input type="password" class="form-control validate[required]" placeholder="Confirm"  name="repeat"  id="repeat">
                    </div>
                    <!-- <div class="checkbox">
                        <label>
                            <input type="checkbox" id="agree" class="validate[required]">I agree the Privacy Policy
                        </label>
                    </div> -->
                    <input type="submit" class="btn-system btn-large" value="Change" name="op" id="op">
                </form>
              	<input type="hidden" name="id" id="id" value="<%= Uid%>">
				<input type="hidden" name="type" id="type" value="3">
				<input type="hidden" name="pass" id="pass" value="<%= Pass%>">
            </div>
			 </div>	

         </div>
      </div>
    </div>
 <script type="text/javascript">
 $('#STmenu').addClass('active');
</script>
<jsp:include page="Footer.jsp"></jsp:include>