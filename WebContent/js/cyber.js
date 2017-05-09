$(document).ready(function() {
	//.......Admin Login ..............//
	 $("#LoginForm").validationEngine('attach');
	 $('#LoginForm').submit(function(){ 
		 if($("#LoginForm").validationEngine('validate'))
		 {
			 $.ajax({
	                url:'LoginServlet',
	                type: 'POST',
	                data:  {
	                	'op':'login',
	                	'username':$('#username').val(),
	                	'password':$('#password').val(),
	                	'type':$('#type').val()
	                },
	                dataType: "text",
	            success: function(result)
	            {
	            	if(result == "invalid")
	            	{
	                   sweetAlert('Error',"Username or Password is invalid !",'error');
	                   
		            }
	            	else if(result == "inactive")
	            	{
	            		sweetAlert("",'Your account is inactive..!', "error");
	            	}
	                else 
	                {
	                	window.location.href= result;
	                  // sweetAlert("",'Failed to Register, Please try again..!', "error");
	                } 
	            },
	             error: function(jqXHR, textStatus, errorThrown) 
	             {
	            	 sweetAlert("",'Something went wrong , Please try again..!', "error");
	             }          
	          });
		 	}
		 return false;
	 });
	 //...........Log Out ...........................//
	 $('#signout').click(function(){
		 var type = $('#logType').val();
		 $.ajax({
             url:'LoginServlet',
             type: 'POST',
             data:  {
             	'op':'logout',
             },
             dataType: "text",
         success: function(result)
         {
        	 if(type == "ADM")
        		 location.href="AdminLogin.jsp"; 
        	 else if(type == "USR")
        		 location.href="Home.jsp"; 
         }
	   });
	 });
//...........B type radio................//
	 $('.bt').change(function(){
		 if($(this).val()=='Lease')
			 $('#dur').slideDown();
		 else
			 $('#dur').slideUp();
	 });
 //..................Building form submit function...............//
	 $("#BuildingForm").validationEngine('attach');
	 $('#BuildingForm').submit(function(){ 
		 if($("#BuildingForm").validationEngine('validate'))
		 {
			 var Dat    =	getAllformvalues('BuildingForm');
			 $.ajax({
	                url:'BuildingServlet',
	                type: 'POST',
	                data: Dat,
	                dataType: "text",
	            success: function(result)
	            {
	            	var text = ($('#op').val()=="Update")?"Updated Successfully !":"Successfully Saved !";
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: text,
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     window.location.href = window.location.href;
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 
	//..................Vacancy form submit function...............//
	 $("#VacancyForm").validationEngine('attach');
	 $('#VacancyForm').submit(function(){ 
		 if($("#VacancyForm").validationEngine('validate'))
		 {
			 var Dat    =	getAllformvalues('VacancyForm');
			 $.ajax({
	                url:'VacancyServlet',
	                type: 'POST',
	                data: Dat,
	                dataType: "text",
	            success: function(result)
	            {
	            	var text = ($('#op').val()=="Update")?"Updated Successfully !":"Successfully Saved !";
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: text,
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     window.location.href = window.location.href;
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 
	//..................Floor form submit function...............//
	 $("#FloorForm").validationEngine('attach');
	 $('#FloorForm').submit(function(){ 
		 if($("#FloorForm").validationEngine('validate'))
		 {
			 var Dat    =	getAllformvalues('FloorForm');
			 $.ajax({
	                url:'FloorServlet',
	                type: 'POST',
	                data: Dat,
	                dataType: "text",
	            success: function(result)
	            {
	            	var text = ($('#op').val()=="Update")?"Updated Successfully !":"Successfully Saved !";
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: text,
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     window.location.href = window.location.href;
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 
	 //.........................Room Submit Function.....................//
	 $("#RoomForm").validationEngine('attach');
	 $('#RoomForm').submit(function()
	 { 
		 if($("#RoomForm").validationEngine('validate'))
		 {
			 var Dat    =	getAllformvalues('RoomForm');
			 $.ajax({
	                url:'RoomServlet',
	                type: 'POST',
	                data: Dat,
	                dataType: "text",
	            success: function(result)
	            {
	            	var text = ($('#op').val()=="Update")?"Updated Successfully !":"Successfully Saved !";
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: text,
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     window.location.href = window.location.href;
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 
	 
	 $('#logout').click(function(){
		 $.ajax({
             url:'LoginServlet',
             type: 'POST',
             data:  {
             	'op':'logout',
             },
             dataType: "text",
         success: function(result)
         {
        	location.href="UserLogin.jsp"; 
         }
	   });
	 });
	 
	 //................Cancel Button......................//
	 $('.cancel').click(function(){
		 var target = $(this).attr('data-target');
		 $(target).slideUp();
		 $('#op').val('Save');
	 });
	 
	 //................Add Button......................//
	 $('.add').click(function(){
		 var target = $(this).attr('data-target');
		 $(target).slideDown();
	 });
	 
	//................Onchange buil......................//
	 $('#buil_id').change(function(){
		 var target = $(this).val();
		 $('.fls').hide();
		 $('.'+target).show();
		 $('#floor').val("");
		 $('#floor').trigger('change');
	 });
	 $('.fls').hide();
	 
	 $("#PayForm").validationEngine('attach');
	 $('#PayForm').submit(function(){ 
		 if($("#PayForm").validationEngine('validate'))
		 {
			 //3737-321345-610004
			 $.ajax({
	                url:'RentServlet',
	                type: 'POST',
	                data: {
	                		'rid':$('#rent_id').val(),
	                		'op':"Pay",
	                		'amt':$('#amount').val()
	                		},
	                dataType: "text",
	            success: function(result)
	            {
	            	var text = "Your Payment Done Successfully..!";
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: text,
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     window.location.href = window.location.href;
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 }
		 return false;
	 });
	 $('.payNow').click(function(){
		 var Rid  = $(this).attr('rn_id');
		 var Amt  =	$(this).attr('amt');
		 $('#rent_id').val(Rid);
		 $('#amount').val(Amt);
	 });
	 
	 
	 //..................Change Password........................//
	 $("#pswd_frm").validationEngine('attach', {scroll: false});
	 $('#pswd_frm').submit(function(){ 
		 if($("#pswd_frm").validationEngine('validate'))
		 {
			 if($('#current').val() != $('#pass').val()){
				 $('#current').validationEngine('showPrompt','*Incorrect Password ! ', 'error','topRight', true);
				 return false;
			 }else if($('#new').val() != $('#repeat').val()){
				 $('#repeat').validationEngine('showPrompt','*PAssword Mismatch ! ', 'error','topRight', true);
				return false;
			 }
			 $.ajax({
	                url:'LoginServlet',
	                type: 'POST',
	                data:  {
	                	'op':'ChangeP',
	                	'pass':$('#new').val(),
	                	'id':$('#id').val(),
	                	'type':$('#type').val()
	                },
	                dataType: "text",
	            success: function(result)
	            {
	            	if(result == "success")
	            	{
	                   swal({ 
	            		   title: "Success",
	            		    text: "Password Changed !",
	            		     type: "success" 
	            		   },
	            		   function(){
	            		     window.location.href = window.location.href;
	            		 });
	                }else 
	                {
	                	sweetAlert("",'Failed to Change, Please try again..!', "error");
	                } 
	            },
	             error: function(jqXHR, textStatus, errorThrown) 
	             {
	            	 sweetAlert("",'Something went wrong , Please try again..!', "error");
	             }          
	            });
		 }
		 return false;
	  });
	 
	 //....................Company SignUp.......................//
	 $("#CompanyForm").validationEngine('attach');
	 $('#CompanyForm').submit(function(){ 
		 if($("#CompanyForm").validationEngine('validate'))
		 {
		 if($('#password').val() != $('#cpassword').val())
			{
				$('#cpassword').validationEngine('showPrompt','*Password Does not match ', 'error','topRight', true);
				return false;
			}
			 var formData    =   new FormData(this);
			 formData.append('op',$('#op').val());
			 $.ajax({
	                url:'CompanyServlet',
	                type: 'POST',
	                data: formData,
	                dataType: "json",
	                mimeType:"multipart/form-data",
	                contentType: false,
	                cache: false,
	                processData:false,
	            success: function(result)
	            {
	            	var text = ($('#op').val()=="Update")?"Updated Successfully !":"Successfully Saved !";
	            	if(result.status == "success")
	            	{
	            		window.location.href = "SelectRoom.jsp?cmp="+result.comp_id;
	             	}
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 
	//....................User SignUp.......................//
	 $("#UserForm").validationEngine('attach');
	 $('#UserForm').submit(function(){ 
		 if($("#UserForm").validationEngine('validate')  && checkFile())
		 {
			if($('#password').val() != $('#cpassword').val())
			{
				$('#cpassword').validationEngine('showPrompt','*Password Does not match ', 'error','topRight', true);
				return false;
			}
			 var formData    =   new FormData(this);
			 formData.append('op',$('#op').val());
			 $.ajax({
	                url:'UserServlet',
	                type: 'POST',
	                data:  formData,
	                mimeType:"multipart/form-data",
	                contentType: false,
	                cache: false,
	                processData:false,
	                dataType: "text",
	            success: function(result)
	            {
	            	var msg = "Successfully Saved";
	            	
	               if(result == "success") {
	                   swal({ 
	            		   title: "Success",
	            		    text: msg,
	            		     type: "success" 
	            		   },
	            		   function(){
	            		     window.location.href = window.location.href;
	            		 });
	                }
	               else 
	                {
	                   sweetAlert("",'Failed to add, Please try again..!', "error");
	                } 
	            },
	            beforeSend: function(){
	                $('.loader').show();
	            },
	            complete: function(){
	                $('.loader').hide();
	            },
	             error: function(jqXHR, textStatus, errorThrown) 
	             {
	            	 sweetAlert("",'Something went wrong , Please try again..!', "error");
	             }          
	            });
		 }
		 
		 return false;
	 });
	 
	 $('#resume').on( 'change', function() {
		   checkFile();
	 });
	 
	 $('.FlrC').change(function(){
		 var floor		=	$(this).val();
		 floor			=	(floor == "")?0:floor;
		 $.ajax({
             url:'RoomServlet',
             type: 'POST',
             data:  {
             	'op':'GetRooms',
             	'floor':floor
             },
             dataType: "text",
         success: function(result)
         {
        	$('#roomList').html(result); 
         }
	   });
    });
	 
	 $('body').on('click', '.available', function(){
		 $('.available').removeClass('select-book');
		 $(this).addClass('select-book');
		 $('#roomId').val($(this).attr('RmId'));
	 });
	 $('body').on('click', '.booked , .notavailable', function(){
		 $('.available').removeClass('select-book');
		 $('#roomId').val('');
	 });
	 
	 $('#RselectFrm').submit(function(){ 
		 var 	cmp_id		=	$('#cmpId').val();
		 var	room_id		=	$('#roomId').val();
		 if(room_id ==	'')
		 {
			 sweetAlert("Warning.!",'Please select a room to continue..!', "warning");
			 return false;
		 }
		 else
		 {
			 $.ajax({
	                url:'CompanyServlet',
	                type: 'POST',
	                data:  {
	                	'op':'FixRoom',
	                	'comp_id':cmp_id,
	                	'room_id':room_id,
	                },
	                dataType: "text",
	            success: function(result)
	            {
	            	if(result == "success")
	            	{
	            		$('#msSuccess').addClass('in');
	            		
	                }else 
	                {
	                	$('#msError').addClass('in');
	                } 
	            	$('#myModal').modal('show');
	            },
	             error: function(jqXHR, textStatus, errorThrown) 
	             {
	            	 sweetAlert("",'Something went wrong , Please try again..!', "error");
	             }          
	            });
		 }
		 return false;
		
	 });
	 
	 //................Contact Submit..................................//
	 $("#contact-form").validationEngine('attach');
	 $('#contact-form').submit(function(){ 
		 if($("#contact-form").validationEngine('validate'))
		 {
			 var Dat    =	getAllformvalues('contact-form');
			 $.ajax({
	                url:'UserServlet',
	                type: 'POST',
	                data: Dat,
	                dataType: "text",
	            success: function(result)
	            {
	            	if(result == "success")
	            	{
	            		swal({ 
	             		   title: "Success",
	             		    text: "Message sent Successfully.!",
	             		     type: "success" 
	             		   },
	             		   function(){
	             		     $('#contact-form')[0].reset();
	             		 });
		            }
	            	else 
	                {
	                   sweetAlert("",'Failed to Save, Please try again..!', "error");
	                } 
	            }         
	          });
		 	}
		 return false;
	 });
	 //...............Alert Close.........................//
	 $('.close').click(function () {
		  $(this).parent().removeClass('in'); // hides alert with Bootstrap CSS3 implem
		  $('#RselectFrm')[0].reset();
  		  $('#floor').trigger('change');
	});
	 
	 //..............Show Resume..............................//
	 $('.reumeS').click(function(){
		 var src	=	$(this).attr('filePath');
		 $('#resFrame').attr('src',src);
	 });
	 
	 
	 $('#CmpTable').dataTable();
	 $('#jobs').dataTable();
	 $('#VacTable').dataTable();
	 $('#AppTable').dataTable();
	 $('#BuilTable').dataTable();
	 $('#FloorTable').dataTable();
	 $('#RoomTable').dataTable();
	 $('#UsrTable').dataTable();
	
});

//////////////GET ALL VALUES IN FORM/////////////////
function getAllformvalues(formid) 
{
	
    var inputValues             =   {};
    jQuery('#' + formid + ' input').each(function () {
        var type                =   jQuery(this).attr('type');
        var name                =   jQuery(this).attr('name');
        var id                  =   jQuery(this).attr('id');
        var type                =   jQuery(this).attr("type");
        if ((type == "checkbox" || type == "radio") ) {
        	if($(this).prop('checked'))
             inputValues[name]   =   jQuery(this).val();
        } else if (type != "button" ) {
            inputValues[name]   =   jQuery(this).val();
        }
    });
    
    
    jQuery('select').each(function () {
        var name = jQuery(this).attr('name');
        inputValues[name]       =   jQuery(this).val();

    });
    jQuery('textarea').each(function () {
        var name                =   jQuery(this).attr('name');
        var id                  =   jQuery(this).attr('id');
        inputValues[name]       =   jQuery(this).val();
    });
    return inputValues;
}


//////////////////////DELETE FUNCTION////////////////////////////
function Delete(id,url) 
{
	swal({
		title: "Are you sure?",
        text: "You want to delete this record..!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, please delete!",
        closeOnConfirm: false,
    }, function(){   
    	
		 $.ajax({
            url				: url,
            dataType		: "text",
            type			: 'POST',
            data:{'id'    	:  id	,	
            	  'op'      :  'Delete'
                 },
            success: function(result)
            {
               if(result == "success") {
                   swal({ 
            		   title: "Success",
            		    text: "Successfully deleted.!",
            		     type: "success" 
            		   },
            		   function(){
            		     window.location.href = window.location.href;
            		 });
                }
                else 
                {
                   sweetAlert("",'Failed to add, Please try again..!', "error");
                } 
            },
             error: function(jqXHR, textStatus, errorThrown) 
             {
            	 sweetAlert("",'Something went wrong , Please try again..!', "error");
             }          
        }); 
		 
        
    });
}
//////////////////////DELETE FUNCTION////////////////////////////
function ChangeStatus(id,url,status) 
{
	$.ajax({
        url				: url,
        dataType		: "text",
        type			: 'POST',
        data:{'id'    	:  id	,	
        	  'op'      :  'ChangeStatus',
        	  'status'  :  status
             },
        success: function(result)
        {
           if(result == "success") {
              window.location.href = window.location.href;
           }
           else 
           {
        	   sweetAlert("",'Failed to add, Please try again..!', "error");
           } 
        },
         error: function(jqXHR, textStatus, errorThrown) 
         {
        	 sweetAlert("",'Something went wrong , Please try again..!', "error");
         }          
    }); 
}
////////////////////////Edit Building///////////////
function EditBuilding(id)
{
	$.ajax({
        url: 'BuildingServlet', 
        type: 'POST',
        data:  {
        	'op':"Edit",
        	'id':id
        },
        dataType: "json",
    success: function(result)
    {
    	/*$('input[name=b_type]').removeAttr('checked');*/
    	$('#addClient').slideDown();
    	$('#op').val('Update');
    	$('#b_name').val(result.buil_name);
    	$('#description').val(result.buil_descr);
    	/*$('.b').removeAttr('checked');
    	$('input[name=b_type][value='+result.buil_type+']').prop('checked','checked');*/
    	$('#id').val(result.buil_id);
    	/*if(result.buil_type =='Lease')
			 $('#dur').slideDown();
		 else
			 $('#dur').slideUp();*/
    	/*$('#duration').val(result.duration);*/
    	
    	
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}

////////////////////////Edit Floor///////////////
function EditFloor(id)
{
	$.ajax({
        url: 'FloorServlet', 
        type: 'POST',
        data:  {
        	'op':"Edit",
        	'id':id
        },
        dataType: "json",
    success: function(result)
    {
    	$('#addClient').slideDown();
    	$('#op').val('Update');
    	$('#floor').val(result.floor_name);
    	$('#description').val(result.descr);
    	$('#building').val(result.buil_id);
    	$('#id').val(result.floor_id);
    	$('#rent').val(result.rent);
    	    	
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}


/////////////Edit Vacancy ///////////////////////
function EditVacancy(id)
{
	$.ajax({
        url: 'VacancyServlet', 
        type: 'POST',
        data:  {
        	'op':"Edit",
        	'id':id
        },
        dataType: "json",
    success: function(result)
    {
    	$('#addClient').slideDown();
    	$('#op').val('Update');
    	$('#desig').val(result.post);
    	$('#dept').val(result.dept);
    	$('#quali').val(result.qlfn);
    	$('#id').val(result.vac_id);
    	$('#salary').val(result.salary);
    	$('#total').val(result.total);
    	$('#dateIn').val(result.dist);
    	$('#type').val(result.type);
    	$('#description').val(result.description);
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}

/////////////Edit Vacancy ///////////////////////
function EditRoom(id)
{
	$.ajax({
        url: 'RoomServlet', 
        type: 'POST',
        data:  {
        	'op':"Edit",
        	'id':id
        },
        dataType: "json",
    success: function(result)
    {
    	$('#addClient').slideDown();
    	$('#op').val('Update');
    	$('#buil_id').val(result.buil_id);
    	$('#buil_id').trigger('change');
    	$('#room').val(result.r_name);
    	$('#floor').val(result.floor_id);
    	$('#id').val(result.room_id);
    	$('#door_num').val(result.door_num);
    	$('#s_feet').val(result.s_feet);
    	//$('#dateIn').val(result.date);
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}

//..........Approve...............................//
function Approve(comp_id,room_id,cmp_name,email)
{
	$.ajax({
        url: 'CompanyServlet', 
        type: 'POST',
        data:  {
        	'op':"Approve",
        	'comp_id':comp_id,
        	'room_id':room_id,
        	'cmp_name':cmp_name,
        	'email':email
        },
        dataType: "text",
    success: function(result)
    {
    	if(result == "success") {
            swal({ 
     		   title: "Success",
     		    text: "Company Successfully Approved.!",
     		     type: "success" 
     		   },
     		   function(){
     		     window.location.href = window.location.href;
     		 });
         }
         else 
         {
            sweetAlert("",'Failed to add, Please try again..!', "error");
         } 
    },
    beforeSend: function(){
        $('.loader').show();
    },
    complete: function(){
        $('.loader').hide();
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}

function checkFile()
{
   var myfile= $('#resume').val();
   if(myfile == "")
	   return true;
   var ext = myfile.split('.').pop();
   if(ext=="pdf" || ext=="PDF"){
       return true;
   } else{
	   $('#resume').validationEngine('showPrompt','Only pdf files are allowed  ', 'error','topRight', true);
	   return false;
   }
}

//..........Apply for Job........................//
function Apply(uid,vac_id)
{
	$.ajax({
        url: 'VacancyServlet', 
        type: 'POST',
        data:  {
        	'op':"Apply",
        	'uid':uid,
        	'vac_id':vac_id,
        	 },
        dataType: "text",
    success: function(result)
    {
    	if(result == "success") {
    		sweetAlert("",'You have successfully applied..!', "success");
         }
         else 
         {
            sweetAlert("",'Failed to add, Please try again..!', "error");
         } 
    },
    /*beforeSend: function(){
        $('.loader').show();
    },
    complete: function(){
        $('.loader').hide();
    },*/
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}


function Invite(app_id,post,email,dateS,name,comp)
{
	$.ajax({
        url: 'VacancyServlet', 
        type: 'POST',
        data:  {
        	'op':"Invite",
        	'app_id':app_id,
        	'vac':post,
        	'email':email,
        	'date':dateS,
        	'name':name,
        	'comp':comp
        	 },
        dataType: "text",
    success: function(result)
    {
    	if(result == "success") {
    		 swal({ 
       		   title: "Success",
       		    text: "Invited for interview..!",
       		     type: "success" 
       		   },
       		   function(){
       		     window.location.href = window.location.href;
       		 });
    	 }
         else 
         {
            sweetAlert("",'Failed to add, Please try again..!', "error");
         } 
    },
    beforeSend: function(){
        $('.loader').show();
    },
    complete: function(){
        $('.loader').hide();
    },
     error: function(jqXHR, textStatus, errorThrown) 
     {
    	 sweetAlert("",'Something went wrong , Please try again..!', "error");
     }          
    });
}

//view selected image before upload
//parameter :- input: 'this' file field,
//         viewId: id of view token
//         width: width of image
//          height:height of image
function viewImage(input,viewId,image_width,image_height) 
{

if (input.files && input.files[0]) {
    var reader          = new FileReader();

    reader.onload       = function (e) {
        $('#'+viewId)
            .attr('src', e.target.result)
            .width(image_width)
            .height(image_height);
    };
    reader.readAsDataURL(input.files[0]);
}
}
