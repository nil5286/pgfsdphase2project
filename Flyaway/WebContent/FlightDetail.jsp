<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightbookingsystem"  
     user="root"  password="root"/>   
<c:if test="${sessionScope.session!=null}">

<sql:query dataSource="${db}" var="records">
    select flightno, airlinename , source , destination ,bookedseat, seat_availibility , class , price from FlightDetails where source=? and destination=?;    
   <sql:param value="${sessionScope.from}"/>
   <sql:param value="${sessionScope.to}"/>
</sql:query>
   		
</c:if> 

<c:if test="${param.flightno!=null}">
   		<c:set var="flightno" value="${param.flightno}" scope="session" />
   		<c:set var="totalprice" value="${param.totalprice}" scope="session" />
   		<c:set var="bookedseat" value="${param.bookedseat}" scope="session" />
   		<c:redirect url="Booking.jsp"></c:redirect>  		
</c:if> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>.
<meta charset="UTF-8">
  <title>Flight Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>

  	<h2>Flight Details</h2>
			<form id="flight-form"  method="post" action="FlightDetail.jsp">
               <table border="2" width="100%">  
						<tr>  
						<th>Flight No</th>  
						<th>Flight Name</th>  
						<th>Source</th>  
						<th>Destination</th>  
						<th>AvailableSeat</th>
						<th>Class</th>
						<th>Price Of one seat</th>
						<th>Total price</th>
						<th>Action</th>
						</tr>  
							<c:forEach var="table" items="${records.rows}"> 
							
								<c:if test="${table.seat_availibility>=sessionScope.people}"> 
									<tr>  
										<td><input readonly="readonly" name="flightno" id="flightno" value="${table.flightno}"></td> 
										<td><input readonly="readonly" name="airlinename" id="airlinename" value="${table.airlinename}"></td>  
										<td><input readonly="readonly" name="source" id="source" value="${table.source}"></td>  
										<td><input readonly="readonly" name="destination" id="destination" value="${table.destination}"></td>  
										<td><input readonly="readonly" name="seat_availibility" id="seat_availibility" value="${table.seat_availibility}"></td>
										<td><input readonly="readonly" name="class" id="class" value="${table.Class}"></td>
										<td><input readonly="readonly" name="price" id="price" value="${table.price}"></td>
										<td><input readonly="readonly" name="totalprice" id="totalprice" value="${table.price*sessionScope.people}">
										<input hidden name="bookedseat" id="bookedseat" value="${table.bookedseat}"></td>
										<td><button  type="submit" style="" class="btn col-xs-5 col-md-5">Book Flight</button></td>
										
									</tr>  
								</c:if> 
							</c:forEach>  
					</table>  
            </form>
</body>
</html>