<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightbookingsystem"  
     user="root"  password="root"/>   
     
<c:if test="${param.oldpassword!=null}">
<c:out value = "checking"/>
 <sql:update dataSource = "${db}" var = "count">
         UPDATE Admin_Login SET password = ? WHERE username = 'admin@flyaway.com'
         <sql:param value = "${param.newpassword}" />
  </sql:update>
      <c:if test="${count<1}">  
     		<c:out value = "Task Failed"/>
  		</c:if>  
  	  <c:if test="${count==1}">  	  		
     		<c:redirect url="adminlogin.jsp"/>  
  	  </c:if>   
   				 
           
</c:if>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Admin Password</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
<div id="login-form-wrap">
<h2>Change Admin Password</h2>
 <form id="changepassword-form" action="changepassword.jsp" method="post">
 <div class="form-control">
Old Password
<input  required type="text" name="oldpassword"/>
</div> <br>
<div class="form-control">
New Password 
<input required type="text" name="newpassword"/></div> <br>
<div class="form-control">
Confirm New Password 
<input  required type="text" name="confirmpassword"/>
</div> <br>
<button type="submit"> Change Password </button>
</form>
</body>
</html>

