<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightbookingsystem"  
     user="root"  password="root"/>   
<c:if test="${sessionScope.session!=null}">

<sql:query dataSource="${db}" var="records">
     
 select fl.flightno,fl.airlinename, pd.email , pd.fullname, pd.seatsbooked ,pd.mobile,
  (pd.seatsbooked*fl.price) as totalprice from FlightDetails fl,RegisterDetails pd ,
  BookingDetails bd where bd.email=pd.email and bd.flightno=fl.flightno 

</sql:query>
   		
</c:if> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>All Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div style="display:flex;justify-content: space-evenly;">
	<h2>Admin - All Booked Flight Details</h2>
	<a href="adminlogin.jsp" style="margin-top:30px;color:black">Logout</a>
	</div>
			<form id="login-form"  method="post" action="FlightDetail.jsp">
               <table border="2" width="100%">  
						<tr>  
						<th>Flight No</th>  
						<th>Flight Name</th>  
						<th>Email</th>  
						<th>Full Name</th>  
						<th>Passenger</th>
						<th>Mobile</th>
						<th>Total price</th>
						</tr>  
							<c:forEach var="table" items="${records.rows}"> 
									<tr>  
										<td><input readonly="readonly" name="flightno" id="flightno" value="${table.flightno}"></td>  
										<td><input readonly="readonly" name="airlinename" id="airlinename" value="${table.airlinename}"></td>  
										<td><input readonly="readonly" name="email" id="email" value="${table.email}"></td>  
										<td><input readonly="readonly" name="FullName" id="FullName" value="${table.fullname}"></td>  
										<td><input readonly="readonly" name="Passenger" id="Passenger" value="${table.seatsbooked}"></td>
										<td><input readonly="readonly" name="mobile" id="mobile" value="${table.mobile}"></td>
										<td><input readonly="readonly" name="totalprice" id="totalprice" value="${table.totalprice}"></td>
										
									</tr>  
							</c:forEach>  
					</table>  
            </form>
</body>
</html>