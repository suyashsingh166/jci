<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.jci.model.RawJuteProcurementAndPayment"%>

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
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
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
                <h1 class="page-title">Procurement List</h1>
            </div>
			<%
				 List <RawJuteProcurementAndPayment>  procurementList = (List <RawJuteProcurementAndPayment>) request.getAttribute("procurementList");
			%>
                   <div class="table-responsive">                    
                        <table id="farmerVerific" class="table table-striped table-bordered table-hover" cellspacing="0" >
								<thead>
									<tr>
										<th>Sl.No</th>
										<th>Registration No</th>
										<th>Form Number</th>
										<th>Jute Variety</th>
										<th>Rate Slip Number</th>
								<!-- 		<th>Registered By</th> -->
										<th>Verify</th>
								</thead>
								<tbody>
								<%
								int i= 1;
								for(RawJuteProcurementAndPayment procurementLists : procurementList){
									%>
									<tr role="row" class="odd">
										<td class="sorting_1"><%=i%></td>
										<td><%=procurementLists.getFarmerregno()%></td>
										<td><%=procurementLists.getFormno()%></td> 
										<td><%=procurementLists.getJutevariety()%></td>
										<td><%=procurementLists.getRateslipno()%></td>
										<td><a href="editProcurement.obj?id=<%=procurementLists.getPtsid()%>"/>Edit</a></td>
										<!-- <td><a href="editFarmerReg.obj?id=3">Edit</a></td> -->
										
										</tr>
									<%
									i++; 
								}
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
    <script type="text/javascript">
        /* $(function() {
            $('#example-table').DataTable({
                pageLength: 10,
                "scrollX": true
                //"ajax": './assets/demo/data/table_data.json',
                /*"columns": [
                    { "S": "name" },
                    { "data": "office" },
                    { "data": "extn" },
                    { "data": "start_date" },
                    { "data": "salary" }
                ]
            });
        }) */
        
        $(document).ready(function () {
            $("#farmerVerific").DataTable({         
              scrollX: true
            });
          }); 
    </script>
</body>

</html>
