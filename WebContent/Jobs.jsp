<%@page import="com.CyberVillage.Models.VacancyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.VacancyService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"></jsp:include>
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("USER_DATA");
 int Uid 		=	0;
 if(null == lm)
 	response.sendRedirect("UserLogin.jsp");
 else
	 Uid = lm.getUid();
 %>
 <link rel="stylesheet" href="plugins/datepicker/jquery-ui.css">
 <script src="plugins/datepicker/jquery-ui.js"></script>
 <script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
<!-- Start Page Banner -->
    <div class="page-banner" style="padding:40px 0;  background: url(images/slide-02-bg.jpg) center #f9f9f9;">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h2>Search Jobs</h2>
            <p>We Are Professional</p>
          </div>
          <div class="col-md-6">
            <ul class="breadcrumbs">
              <li><a href="Home.jsp">Home</a></li>
              <li>Jobs</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Page Banner -->
    <div id="content">
      <div class="container">
        <div class="page-content">
          <div class="row">
          	<div class="col-md-10">
   <!--      -------------------------------------------------------  	 -->
   <% 
     VacancyService vs=new VacancyService();
	 ArrayList<VacancyModel>arr=vs.selectAllVacancies();
	 %>
   <table id="jobs" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th><img src="images/jobs.png" style=" height: 125px;margin-left: 40%;"></th>
                  </tr>
                </thead>
                <tbody>
                <% for(VacancyModel vm:arr) {%>
                <tr><td>
                
          	<section id="block-views-job-listings-block-3" class="block block-views clearfix">

      <div class="view view-job-listings view-id-job_listings view-display-id-block_3 view-dom-id-4ebbbc4296f75a092ef4560a9d63af0a">
     <div class="view-content">
       <div class="views-row views-row-4 views-row-even row">
      <div class="views-field views-field-edit-node">        <span class="field-content"></span>  </div>  
  			<div class="views-field views-field-nothing-1">        <span class="field-content"><div class="col-md-8 col-sm-8 col-xs-12">
		<h3><a href="javascript:"><%=vm.getPost() %></a></h3> 
		<div class="features">
	<span class="type"><i class="fa fa-clock-o"></i><span class="expire-label">Type:</span> <a href="javascript:"><%=vm.getType() %></a></span>
	<span class="expires"><i class="fa fa-briefcase"></i><span class="expire-label">Department:</span><%=vm.getDept() %></span>
	<span class="industry"><i class="fa fa-building-o"></i><span class="expire-label">Qualification:</span> <a href="javascript:"><%=vm.getQlfn() %></a></span>
	</div>
	<div class="description"><p><%=vm.getDescription() %></p></div>
<div class="tags"><span class="label-tags">Details:</span> <ul>
<li class="first"><a href="javascript:">Salary : <%=vm.getSalary() %></a></li>
<%-- <li><a href="javascript:" >Percentage Of Mark : <%=vm.getPercentage() %>%</a></li>
<li><a href="javascript:" >Linux</a></li>
<li><a href="javascript:" >jQuery</a></li> --%>
</ul></div>
</div></span>  </div>  
  <div class="views-field views-field-nothing">        <span class="field-content"><div class="col-md-3 col-sm-4 col-xs-12">
<div class="company-logo"><a href="javascript:"><img typeof="foaf:Image" src="Uploads/Company_Admin/<%=vm.getC_logo() %>" alt="" height="74" width="100"></a></div>
<div class="business" style="text-align: center;"><a href="javascript:"><%=vm.getComp_name() %></a></div>
<div class="posted" style="text-align: center;"><span class="label-posted">Job posted on:</span> <em class="placeholder"><%=vm.getPosted_on() %></em></div>
</div>
<div class="col-md-1">
<a class="btn-system btn-large pull-right" href="javascript:" style="margin-top: 100px;" onclick="Apply(<%=Uid%>,<%=vm.getVac_id()%>)">Apply</a></div></span>  </div>  

</div>
  
    </div>
  
  
</div>  
</section>
</td></tr>
<% } %>
</tbody></table>
   <!--    ...........................................................    	 -->
          	</div>
          	<div class="col-md-2">
          		<aside>
				<div class="block light apng" href="/animated-png">
					<a class="block light hiring" target="_blank" href="javascript:">
					<!-- <h2>We are looking for Candidates.!</h2> -->
					</a>
				</div>
				</aside>
          	</div>
          </div>
        </div>
      </div>
    </div>
 
 
 <script type="text/javascript">
 $('#Jmenu').addClass('active');
</script>  
    <style>
    
.clearfix::before, .clearfix::after {
    content: " ";
    display: table;
}
*, *::before, *::after {
    box-sizing: border-box;
}
.clearfix::after {
    clear: both;
}
.clearfix::before, .clearfix::after {
    content: " ";
    display: table;
}
.clearfix::after {
    clear: both;
    content: ".";
    display: block;
    height: 0;
    visibility: hidden;
}
*, *::before, *::after {
    box-sizing: border-box;
}
#block-views-job-listings-block-3 {
    border-right: 1px solid #eeeeee;
    padding-right: 15px;
}
article, aside, details, figcaption, figure, footer, header, hgroup, main, nav, section, summary {
    display: block;
}
*, *::before, *::after {
    box-sizing: border-box;
}
.region-post-content .title-div, .region-content .title-div, aside .title-div {
    border-bottom: 1px solid #cccccc;
    line-height: 0.1em;
    margin: 25px 0;
    text-align: center;
    width: 100%;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
*, *::before, *::after {
    box-sizing: border-box;
}
.row::after {
    clear: both;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
.row::after {
    clear: both;
}
.row::before, .row::after {
    content: " ";
    display: table;
}
*, *::before, *::after {
    box-sizing: border-box;
}
.view-job-listings .views-row {
    border-bottom: 1px solid #cccccc;
    padding-bottom: 20px;
    padding-left: 10px;
    padding-right: 10px;
}
.row {
    margin-left: -15px;
    margin-right: -15px;
}
*, *::before, *::after {
    box-sizing: border-box;
}
.view-job-listings .company-logo {
    margin-top: 25px;
    text-align: center;
}
.view-job-listings .business {
    color: #aaaaaa;
    padding-bottom: 9px;
    padding-top: 2px;
    text-transform: uppercase;
}
.view-job-listings .posted {
    font-size: 0.8em;
}
.view-job-listings .features {
    margin-bottom: 5px;
}
.view-job-listings .features .expire-label {
    color: #aaaaaa;
}
.view-job-listings .features a {
    color: #333333;
}
a {
    color: #428bca;
    text-decoration: none;
}
.view-job-listings .features .expires {
    margin-left: 35px;
}
.view-job-listings .features .industry {
    margin-left: 35px;
}
.view-job-listings .features .expire-label {
    color: #aaaaaa;
}
.view-job-listings .tags .label-tags {
    color: #cccccc;
    float: left;
    margin-top: 13px;
}
ul, ol {
    margin-bottom: 10px;
    margin-top: 0;
}
.view-job-listings .tags li {
    display: inline-block;
}
.view-job-listings .tags a {
    background: none repeat scroll 0 0 #eeeeee;
    color: #999999;
    display: inline-block;
    margin-right: 3px;
    margin-top: 9px;
    padding: 4px 9px;
}




aside .block.hiring::before {animation-duration: 6s;animation-iteration-count: infinite;animation-name: sign;animation-timing-function: ease-in-out;backface-visibility: hidden;background-image: url("images/sign.png");background-repeat: no-repeat;background-size: 7.8125rem 6.9375rem;content: "";height: 6.9375rem;position: absolute;right: 5%;top: -0.15rem;transform: rotate(10deg);transform-origin: 50% 0 0;width: 7.8125rem;}
	aside .block.hiring {
    background: rgba(0, 0, 0, 0) linear-gradient(to bottom, #f5f9fa, #ecf3f6) repeat scroll 0 0;
    min-height: 7rem;
}
@media screen and (max-width: 50em) {
aside .block.hiring::before {
    right: 23%;
}
}
@media screen and (max-width: 40em) {
aside .block.hiring::before {
    right: 10%;
}
}
@media screen and (max-width: 30em) {
aside .block.hiring::before {
    right: 3%;
}
}
@media not all, not all, only screen and (min-resolution: 144dpi) {
aside .block.hiring::before {
    background-image: url("//cdn.tinypng.com/images/sign-2x.png?e2a3f89");
}
}
@keyframes sign {
0% {
    transform: rotate(3deg);
}
25% {
    transform: rotate(-2deg);
}
50% {
    transform: rotate(4deg);
}
75% {
    transform: rotate(-3deg);
}
100% {
    transform: rotate(3deg);
}
}
@keyframes sign {
0% {
    transform: rotate(3deg);
}
25% {
    transform: rotate(-2deg);
}
50% {
    transform: rotate(4deg);
}
75% {
    transform: rotate(-3deg);
}
100% {
    transform: rotate(3deg);
}
}
aside .block.hiring h2 {
    font-size: 1.1rem;
    max-width: 51%;
}
@media screen and (max-width: 50em) {
aside .block.hiring h2 {
    max-width: 100%;
    padding-top: 6rem;
    text-align: center;
}
}
@media screen and (max-width: 40em) {
aside .block.hiring h2 {
    max-width: 50%;
    padding-left: 5%;
    padding-top: 0;
}
}
@media screen and (max-width: 30em) {
aside .block.hiring h2 {
    max-width: 50%;
    padding-left: 0;
    padding-top: 0;
}
}
    </style>
  <jsp:include page="Footer.jsp"></jsp:include>