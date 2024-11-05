<%@page import="com.jci.model.RawJuteProcurementAndPayment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.jci.model.VerifyTallySlip"%>
<%@page import="com.jci.controller.LoginController"%>
<%@page import="com.jci.common.Encry"%>

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
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
 
 <script type="text/javascript">
	$(document).ready(function ()  
	{  
		 $("#verifiedlist").DataTable({         
	         scrollX: true,
	         "pageLength": 50
	       }); 
	});  
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
                <h1 class="page-title">Verification Pending Tally Slip</h1>
                 
            </div>
				
				<%
				String key = LoginController.secretkey;
				List<RawJuteProcurementAndPayment> 	 verificationList = (List<RawJuteProcurementAndPayment>) request.getAttribute("juteList");
				 if(verificationList==null){
					 verificationList = new ArrayList();
				 }
				%>
			 
                    <div class="table-responsive" style="margin-top: 20px;"> 
                         <table id="verifiedlist"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
								<thead>
									<tr>
									    <th>S No.</th>
										<th>Tally SlipNo</th>
										<th>Farmer Reg No</th> 
										<th>Place of Purchase</th> 
									    <th>Purchase Date</th>
										<th>Rates </th> 										
										<th>Bin No</th>
									    <th>Jute Variety</th>
									   <!--  <th>Net Quantity</th> -->
									    <th>Gross Qty</th>
										<th>Garsat Rate</th> 										
										<!-- <th>Amount Payable</th> -->
										<th>Action</th>
										
							</tr>
								</thead>
								<tbody>
									<% 
									int i= 1;
							for(RawJuteProcurementAndPayment verificationlists : verificationList){
        						String encryptedid = Encry.encrypt(String.valueOf(verificationlists.getTallyslipno()),key);

								 if(i<=200){  
									 
							%>
									<tr>
										<td><%=i%></td>
										<td><%=verificationlists.getTallyslipno()%></td>
				                    	<td><%=verificationlists.getFarmerregno()%> 
				                    	<td><%=verificationlists.getPlaceofpurchase()%> 
										<td><%=verificationlists.getDatepurchase()%></td> 
										<td><%=verificationlists.getRateslipno()%></td>
									    <td><%=verificationlists.getBinno()%></td> 
				                    	<td><%=verificationlists.getJutevariety()%></td>
										<%-- <td><%=verificationlists.getNetquantity()%></td>  --%>
										<td><%=verificationlists.getGrossquantity()%></td> 
										<td><%=verificationlists.getGrasatrate()%></td>
						              <%--  <td><%=verificationlists.getAmountpayable()%></td> --%>
						               <td><a href="verificationTallyslip2.obj?tally=<%=verificationlists.getTallyslipno()%>&placeofp=<%=verificationlists.getCreatedfrom()%>" class="btn btn-danger btn-sm btn-block">  <i  aria-hidden="true" style="font-size: 15px;"></i>Verify</a></td> 

									</tr>
									<% 
								  }  
							i++; }
							
							%>
								</tbody>
   
                        </table>
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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
  
  <script>
      $(document).ready(function() {
          $('body').bind('cut copy', function(e) {
              e.preventDefault();
            });
        });
    </script>
</body>

</html>