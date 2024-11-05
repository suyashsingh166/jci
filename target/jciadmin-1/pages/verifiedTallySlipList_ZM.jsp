<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.jci.model.VerifyTallySlip"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
     <title>JCI | CMS</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="./assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="assets/css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
<style>
.scrollmenu {

  overflow: auto;
  white-space: nowrap;
}

.scrollmenu a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px;
  text-decoration: none;
}
</style>
 <script src="https://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript"></script>  
 <script src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js" type="text/javascript"></script>  
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css" /> 
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css"> 
 
 <script type="text/javascript">
	$(document).ready(function ()  
	{  
		 $("#verifiedlist").DataTable({         
	         scrollX: true,
	         "pageLength": 50
	       }); 
	});  
 </script>  
 
 <!-- ................Scripting........... -->
<script type="text/javascript">
	$(document).ready(function() {
		
		$('body').on('click', '#selectAll', function() {
			//alert("ani");
			if ($(this).hasClass('allChecked')) {
				$('input[type="checkbox"]', '#verifiedlist').prop('checked', false);
			} else {
				$('input[type="checkbox"]', '#verifiedlist').prop('checked', true);
			}
			$(this).toggleClass('allChecked');
		});
	});
	function sendMail(roho)
	{

		var tallyno = [];
		var dpcid = [];
		$("input[name='checkbox']:checked").each(function() {
			 var value = $(this).val();
			  var parts = value.split('-');
			    if (parts.length === 2) {  // Ensure that splitting worked correctly
			    	tallyno.push(parts[0]);
			    	dpcid.push(parts[1]);
			    }
		});
		//alert(tallyno+"dpc"+dpcid);
		if (Array.isArray(tallyno) && tallyno.length) {
			 alert("Are you sure to process "+tallyno.length+" tally slip?");
		} else {
			alert("CheckBox Not Selected !..Please Select");
			return false;
		}
       $(".loader").show();
		 $.ajax({
				type:"GET",
				url:"update_paymentstatus.obj",
				data:{"tallyno":JSON.stringify(tallyno),"dpcid":JSON.stringify(dpcid),"roho":roho},
				//async: false,
				success:function(result)
				{
					$(".loader").hide();
					 alert("Payment Advice sheet Generated, Mail has been sent to you and your AFM Accounts!!!");
				     location.reload();
				}
		 });
		 
		
	}
	</script>
	
 
 
</head>

<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- START HEADER-->
         <%@ include file="header.jsp"%>
        <!-- END HEADER-->
        <!-- START SIDEBAR-->
         <%@ include file="sidebar.jsp"%>
        <!-- END SIDEBAR-->
        <div class="content-wrapper">
            <!-- START PAGE CONTENT-->
            <div class="page-heading">
                <h1 class="page-title">Approval Of verified Tally Slip by Regional Manager for payment processing</h1>
                 
            </div>
				
				<%
				 
				List<VerifyTallySlip> 	 verificationList = (List<VerifyTallySlip>) request.getAttribute("verifiedTallyforZM");
				 if(verificationList==null){
					 verificationList = new ArrayList();
				 }
				%>
			 
                    <div class="table-responsive" style="margin-top: 20px;"> 
                         <table id="verifiedlist"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
					
								<thead>
									<tr>
									    <th class="text-center">Select All<br><input type="checkbox" id="selectAll" name="allcb"></th>
									    <th>S No.</th>
										<th>Tally SlipNo</th>
										<th>Farmer Reg No</th> 
										<th>Farmer Name</th>
										<th>DPC Name</th> 
										<th>Basis</th>
									    <th>Purchase Date</th>
									    <th>Net Quntity</th>
										<th>Amount Payable</th>
							</tr>
								</thead>
								<tbody>
									<% 
									int i= 1;
							for(VerifyTallySlip verificationlists : verificationList){
								
								 if(i<=200){  
							%>
									<tr>
									<td class="text-center"><input type="checkbox" id="checkbox" name="checkbox" value="<%=verificationlists.getTallyNo()%>-<%=verificationlists.getErrors()%>" ></td>
										<td><%=i%></td>
										<td><a href="popupimage.obj?tallyno=<%=verificationlists.getTallyNo()%>&dpcid=<%= verificationlists.getErrors() %>" target="_blank"><%=verificationlists.getTallyNo()%></a></td>
										<td><a href="popupimage.obj?tallyno=<%=verificationlists.getTallyNo()%>&farmerno=<%=verificationlists.getFarmerRegNo()%>" target="_blank"><%=verificationlists.getFarmerRegNo()%></a></td>
				                    	<td><%=verificationlists.getFarmer_name()%></td>
				                    	<td><%=verificationlists.getCentername()%></td>
				                    	<td><%=verificationlists.getBasis()%></td>
										<td><%=verificationlists.getDop()%></td> 
										<td><%=verificationlists.getNetquantity()%></td> 
						                <td><%=verificationlists.getAmountpayable()%></td>
						              <!-- <td><a href="update_paymentstatus.obj?tallyno=<%=verificationlists.getTallyNo()%>" class="btn btn-danger btn-sm btn-block">Payment</a></td>
						                 <td><a href="edittallyslip.obj?id=verificationlists.getTallyslipno()%>" class="btn btn-warning btn-sm btn-block">  <i class="fa fa-pencil" aria-hidden="true" style="font-size: 15px;"></i></a></td>-->
										<%-- <td><a onclick="return confirm('Are you sure you want to delete this item?');" href="deletetallyslip.obj?id=<%=verificationlists.getTallyNo()%>" class="btn btn-danger btn-sm btn-block">  <i class="fa fa-trash" aria-hidden="true" style="font-size: 15px;"></i></a></td> --%>
						
										
										
										<%-- <td><%=bnaList.getEnable()==1?"Active":"Inactive"%></td>
	<td><a href="bnaDelete.obj?id=<%=bnaList.getId()%>" class="btn btn-danger btn-sm btn-block" onclick="return confirm('Are you sure you want to delete this BNA')">Delete</a></td> --%>
 						 

									</tr>
									<% 
								  }  
							i++; }
							
							%>
								</tbody>
                     
                        </table>
	                        <div class="row">
			                    <div class="col-sm-3 form-group">    
			                        <input type="submit" value="Process Through HO" onclick ="sendMail('ZMHO')" class="btn btn-primary" id="submit">
	                            </div>
	                        </div>
                        </div>
                        
                     
            <!-- END PAGE CONTENT-->
            <%@ include file="footer.jsp"%>
        </div>
    </div>
    <!-- BEGIN THEME CONFIG PANEL-->
     
    <!-- END THEME CONFIG PANEL-->
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="./assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="assets/js/app.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
  
</body>

</html>