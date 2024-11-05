<%@page import="com.jci.model.DailyReportDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>

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
 
  overflow: scroll;
  white-space: nowrap;
}

.scrollmenu a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px;
  text-decoration: none;
}
.tableFixHead          { overflow: auto; height: 100px; width: 240px; }
.tableFixHead thead th { position: sticky; top: 0; z-index: 1; }
.tableFixHead tbody th { position: sticky; left: 0; }
table  { border-collapse: collapse; width: 100%; }
th, td { padding: 8px 16px; white-space: nowrap; }
th     { background:#eee; }
</style>

<style>
    .btn-green {
        background-color: green;
        color: white; /* This makes the button text white for better contrast */
    }
    .btn-green:hover {
        background-color: darkgreen; /* Optional: a darker green when the button is hovered */
    }
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
                <h1 class="page-title">Daily Report List</h1>
            </div>
                 <% List<DailyReportDTO> dailyList = (List<DailyReportDTO>) request.getAttribute("allDailyReport"); 
                 String Crop_Year =  (String)request.getAttribute("crop_year");
                 String Region =  (String)request.getAttribute("region");
                 String roname =  (String)request.getAttribute("roname");
                 String Basis =  (String)request.getAttribute("basis"); 
                 String Jute_Variety =  (String)request.getAttribute("jute_variety");
                 String Date_of_Purchase =  (String)request.getAttribute("dateofpurchase");
                 String fromdate =  (String)request.getAttribute("fromdate");
                 String todate =  (String)request.getAttribute("todate");
                 String DPC=(String)request.getAttribute("dpcid");
                  %>
                 
                 
                                     <div class="page-content fade-in-up">
                                     <form action = "DailyReportDownload.obj">
                                     
                                     <div class="row">
                                     
                                        <div class="col-sm-4 form-group">
										 <label class="required">Region</label> 
			                             <input class="form-control" type="text" name="region" placeholder="Farmer Address" value="<%=roname %>" readonly>
								         <input type="hidden" name="rocode" value="<%=Region %>">
								          </div>
                                     
				                            <div class="col-sm-4 form-group">
										 <label class="required">Crop Year</label> 
			                             <input class="form-control" type="text" name="crop_year" placeholder="Farmer Address" value="<%=Crop_Year %>" readonly>
								         <input type="hidden" name="crop_year" value="<%=Crop_Year %>">
								          </div>
									
									  <div class="col-sm-4 form-group">
										 <label class="required">Basis</label> 
			                             <input class="form-control" type="text" name="basis" placeholder="Farmer Address" value="<%=Basis %>" readonly>
								         <input type="hidden" name="basis" value="<%=Basis %>">
								          </div>
								         </div>
                                       
									<div class="row">
									
									   <div class="col-sm-4 form-group">
										 <label class="required">Jute Variety</label> 
			                             <input class="form-control" type="text" name="jute_variety" placeholder="Farmer Address" value="<%=Jute_Variety %>" readonly>
								         <input type="hidden" name="jute_variety" value="<%=Jute_Variety %>">
								          </div>
									
										<div class="col-sm-4 form-group">
												<label>From Date </label> 
												<span class="text-danger">* </span>&nbsp; <span id="instrumentdate" name="instrumentdate" class="text-danger"> </span>
											<input class="form-control" name="fromdate" id="fromdate" type="date" placeholder="dd-mm-yyyy" value="<%=fromdate %>" required readonly>
										   </div>
										   	<div class="col-sm-4 form-group">
												<label>To Date </label> 
												<span class="text-danger">* </span>&nbsp; <span id="instrumentdate" name="instrumentdate" class="text-danger"> </span>
											<input class="form-control" name="todate" id="todate" type="date" placeholder="dd-mm-yyyy" value= "<%=todate %>" required readonly>
										   </div>
										   
										
										   </div>
										   
								<div class="row">
								<div class="form-group">
                                        <button class="btn btn-default btn-green" type="submit">Download</button>
                                    </div>
			</div>
			</form>
            <div class="ibox">
                    <span>${msg}</span>
                    <div class="ibox-body">
                    <div class="scrollmenu">
                        <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                             <th class="col-sm-4 text-center">S.N.</th>
                             <th class="col-sm-4 text-center">DPC</th>
                            <th class="col-sm-4 text-center">Gross Quantity</th>
                            <th class="col-sm-4 text-center">Deduction Quantity</th>
                            <th class="col-sm-4 text-center">Net Quantity</th>
                            <th class="col-sm-4 text-center">Garsat Rate</th>
                            <th class="col-sm-4 text-center">Fiber Value</th>
                            <th class="col-sm-4 text-center">Basis Price</th>
                            <th class="col-sm-4 text-center">Gr.1</th>
                            <th class="col-sm-4 text-center">Gr.2</th>
                            <th class="col-sm-4 text-center">Gr.3</th>
                            <th class="col-sm-4 text-center">Gr.4</th>
                            <th class="col-sm-4 text-center">Gr.5</th>
                            <th class="col-sm-4 text-center">Gr.6</th>
                            <th class="col-sm-4 text-center">Gr.7</th>
                            <th class="col-sm-4 text-center">Gr.8</th>
                            
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1;
                        for (DailyReportDTO list : dailyList) { %>
                        <tr>
                            <td><%= i %></td>
										<td id="<%= i %>DPC">
                                                <a href='PurchaseReportList.obj?dpc=<%= URLEncoder.encode(list.getPlacepurd(), "UTF-8") %>&fromdate=<%= URLEncoder.encode(fromdate, "UTF-8") %>&todate=<%= URLEncoder.encode(todate, "UTF-8") %>&basis=<%= URLEncoder.encode(Basis, "UTF-8") %>&CropYear=<%= URLEncoder.encode(Crop_Year, "UTF-8") %>&juteVariety=<%= URLEncoder.encode(Jute_Variety, "UTF-8") %>' class='btn btn-primary btn-sm' target='_blank'>
                                               <%= list.getPlacepurd() %> </a>
                                            </td>
                            
                            <td><%= list.getGrossQuand() %></td>
                            <td><%= list.getDedQuand() %></td>
                            <td><%= list.getNetQuand() %></td>
                            <td><%= list.getGarsatRd() %></td>
                            <td><%= list.getFiberVald() %></td>
                            <td><%= list.getBasisPriced() %></td>
                            <td><%= list.getGr1d() %></td>
                            <td><%= list.getGr2d() %></td>
                            <td><%= list.getGr3d() %></td>
                            <td><%= list.getGr4d() %></td>
                            <td><%= list.getGr5d() %></td>
                            <td><%= list.getGr6d() %></td>
                            <td><%= list.getGr7d() %></td>
                            <td><%= list.getGr8d() %></td>
                            
                           
                        </tr>
                        <% i++;
                        } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
       </div>
    </div>
    <!-- END PAGE CONTENT-->
        <%@ include file="footer.jsp"%>
    

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
        $(function () {
            $('#example-table').DataTable({
                pageLength: 10,
            });
        })
    </script>
 <script type="text/javascript">
    $(document).ready(function() {
        $('#example-table').DataTable({
            fixedHeader: true,
            scrollX: true,
            "paging": true,
            "pageLength": 25
        });
    });
</script>
</body>

</html>
