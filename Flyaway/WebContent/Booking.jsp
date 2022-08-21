<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightbookingsystem"  
     user="root"  password="root"/>   
     
<c:if test="${param.submit!=null}">
 <sql:update dataSource = "${db}" var = "count">
         INSERT INTO RegisterDetails (email,fullname,address,age,mobile,seatsbooked,idtype,idno,country) VALUES (?,?,?,?,?,?,?,?,?);
         <sql:param value = "${param.emailid}" />
         <sql:param value = "${param.FullName}" />
         <sql:param value = "${param.Address}" />
         <sql:param value = "${param.Age}" />
         <sql:param value = "${param.mobile}" />
         <sql:param value = "${sessionScope.people}" />
         <sql:param value = "${param.id}" />
         <sql:param value = "${param.idNo}" />
         <sql:param value = "${param.country}" />
    </sql:update>
      <c:if test="${count<1}">  
     		<c:out value = "Something went wrong. Please contact administrator"/>
  		</c:if>  
  	  <c:if test="${count==1}">
  	  		<c:set var="emailid" value="${param.emailid}" scope="session" />
     		<c:redirect url="Summary.jsp"/>  
  	  </c:if>   
   				 
           
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Register Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
<div id="login-form-wrap">
<h2>Flight Register</h2>
		 <form id="login-form" method="post" action="Booking.jsp"> 
				<div class="form-control">
						Full Name*:  <input required name="FullName" id="FullName" >
						</div>
						<div class="form-control">
						Address*: <input required  name="Address" id="Address"> 
						</div>
						<div class="form-control">
						Age*:  <input required name="Age" id="Age" >
						</div>
						<div class="form-control">
						Mobile*: <input required name="mobile" id="mobile" >
						</div>
						<div class="form-control">
						Email Id*: <input  required name="emailid" id="emailid">
						</div>
						<div class="form-control">
						ID Type*: <select required name="id" class="form-control" id="id" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;">
											<option value="Addhar card" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Addhar card</option>
											<option value="Passport" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Passport</option>
											<option value="Driving License" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Driving license </option>											
											<option value="SSN" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> SSN</option>
											<option value="Voter ID" style = "height: 50px;    margin: 0;    padding: 0 20px;    vertical-align: middle;    background: #fff;    border: 3px solid #fff;    font-family: 'Roboto', sans-serif;    font-size: 16px;    font-weight: 300;    line-height: 50px;    color: #888;    -moz-border-radius: 4px;    -webkit-border-radius: 4px;    border-radius: 4px;    -moz-box-shadow: none;    -webkit-box-shadow: none;    box-shadow: none;    -o-transition: all .3s;    -moz-transition: all .3s;    -webkit-transition: all .3s;    -ms-transition: all .3s;    transition: all .3s;"> Voter ID</option>
											</select>
						</div>					
						<div class="form-control">
						ID No*: <input required name="idNo" id="idNo" >
						</div>
						<div class="form-control">
						Country*: <input required name="country" id="country">
						  </div>
					<div class="form-btns" class="btn col-xs-5 col-md-5">
						<button  type="submit" name="submit" id="submit" style="" >Submit Details</button>
					</div>
				
			</form>
</div>
</body>
</html>