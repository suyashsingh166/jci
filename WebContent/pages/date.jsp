<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      
<head>
    <title>
        jQuery UI | Date Picker
    </title>
      
    <link href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'rel='stylesheet'>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" > </script>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script>
</head>
  
<body>
    Date: <input type="text" id="my_date_picker">
   
    <script>
        $(function() {
            $( "#my_date_picker" ).datepicker({
                defaultDate:"22/09/2019"
            });
        });
    </script>
</body>
  
</html>