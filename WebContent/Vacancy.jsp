<%@page import="com.CyberVillage.Models.VacancyModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.CyberVillage.Services.VacancyService"%>
<%@page import="com.CyberVillage.Models.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="includes/CompanyHeader.jsp"></jsp:include>
<jsp:include page="includes/CompanyMenu.jsp"></jsp:include>
 <% 
 LoginModel lm =(LoginModel)session.getAttribute("COMPANY_DATA");
 int cmp_id    = 0;
 if(null == lm)
 	response.sendRedirect("AdminLogin.jsp");
 else
	 cmp_id        = lm.getUid();
 %>

 <style>
 .form-horizontal .control-label {text-align: left;}
 </style>
 
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> Vacancy <small>Information about vacancies</small> </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Vacancy</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12 collapse" id="addClient" > 
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Add new</h3>
            </div>
            <!-- /.box-header --> 
            <!-- form start -->
            <form class="form-horizontal" id="VacancyForm">
              <div class="box-body">
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Designation</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required, minSize[3]]" id="desig" name="desig" placeholder="Designation">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Department</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="dept" name="dept">
                    	<option value="">--select--</option>
                    	<option value="Java">Java</option>
                    	<option value=".Net">.Net</option>
                    	<option value="Digital Marketing">Digital Marketing</option>
                    	<option value="Android">Android</option>
                    	<option value="BDO">BDO</option>
                        <option value="PHP">PHP</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Minimum Qualification</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="quali" name="quali">
                    	<option value="">--select--</option>
                    	<option value="B Tech">B Tech</option>
                    	<option value="Diploma">Diploma</option>
                    	<option value="M Tech">M Tech</option>
                    	<option value="BSC">BSC</option>
                    	<option value="BCA">BCA</option>
                        <option value="MCA">MCA</option>
                    </select>
                  </div>
                </div>
               <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Offering Salary</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required]" id="salary" name="salary" placeholder="10000 to 50000">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Type of Job</label>
                  <div class="col-sm-10">
                    <select class="form-control validate[required]" id="type" name="type">
                    	<option value="">--select--</option>
                    	<option value="Full Time">Full Time</option>
                    	<option value="Part Time">Part Time</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Total Num. of Vacancies</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required,custom[integer]]" id="total" name="total" placeholder="Number of Vacancies">
                  </div>
                </div>
                
                 <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Date of interview</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control validate[required]" id="dateIn" name="dateIn" placeholder="Date of interview">
                  </div>
                </div>
                <div class="form-group">
                  <label for="" class="col-sm-2 control-label">Description</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" rows="3" placeholder="Any Other Information" name="description" id="description"></textarea>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="button" class="btn btn-default cancel" data-toggle="collapse" data-target="#addClient">Cancel</button>
                <input type="submit" class="btn btn-info pull-right" value="Save" name="op" id="op">
              </div>
              <!-- /.box-footer -->
              <input type="hidden" id="id" name="id">
            </form>
          </div>
          <!-- /.box --> 
          
        </div>
      </div>
      <!-- /.row -->
     <% 
     VacancyService vs=new VacancyService();
	 ArrayList<VacancyModel>arr=vs.selectAllVacanciesByComp_id(cmp_id);
	 %>
      
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Vacancy Table</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-primary btn-sm" data-toggle="collapse" data-target="#addClient">Add New</button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="VacTable" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Designation</th>
                    <th>Department</th>
                    <th>Qualification</th>
                    <th>Salary</th>
                    <th>Num. of Vacancy</th>
                    <th>Interview Date</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <%for(VacancyModel vm:arr) {%>
                  <tr>
                      <td><font color="#110906"><%=vm.getVac_id()%></td>
				      <td><%=vm.getPost() %></td>
				      <td><%=vm.getDept()%></td>
				      <td><%=vm.getQlfn() %></td>
				      <td><%=vm.getSalary() %></td>
				      <td><%=vm.getTotal() %></td>
				      <td><%=vm.getDate() %></td>
				      <td><%=vm.getStatus() %></td>
				      
                    <td> 
                    	<a class="btn btn-default btn-xs" href="javascript:" title="Edit" onclick="EditVacancy(<%=vm.getVac_id()%>);"> <!-- data-toggle="collapse" data-target="#addClient" -->
                    		<i class="fa fa-pencil-square-o"></i>
                    	</a> 
                    	<a href="javascript:" title="Delete" class="btn btn-default btn-xs" onclick="Delete(<%=vm.getVac_id()%>,'VacancyServlet');">
                    		<i class="fa fa-trash-o"></i>
                    	</a> 
                    	<% if(vm.getStatus().equals("Active")){ %>
                    	<a href="javascript:" title="Disable" class="btn btn-danger btn-xs" onclick="ChangeStatus(<%=vm.getVac_id()%>,'VacancyServlet','Inactive');">
                    		<i class="fa fa-ban"></i>
                    	</a>
                    	<%}else{ %>
                    	<a href="javascript:" title="Enable" class="btn btn-success btn-xs" onclick="ChangeStatus(<%=vm.getVac_id()%>,'VacancyServlet','Active');">
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
  <script type="text/javascript">
 //Date picker
 $( "#dateIn" ).datepicker({
	changeYear: true,
	 changeMonth: true,
	 minDate: new Date(),
	 yearRange: "1990:2020",
	 dateFormat: 'yy-mm-dd'
});
 </script>
 <jsp:include page="includes/AdminFooter.jsp"></jsp:include>