<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to Examintion Seating Arrangement System</h2>
			  
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>	
			<li><a href="report-room.jsp">Rooms Reports</a></li>
            <li><a href="report-floor.jsp">Floor Report</a></li>
            <li><a href="report-block.jsp">Block Report</a></li>
			<li><a href="report-seat.jsp">Seat Report</a></li>
			<li><a href="report-student.jsp">Student Report</a></li>
			<li><a href="report-student-seat.jsp">Assign Seat</a></li>
			<li><a href="report-employee.jsp">Users Reports</a></li>
			<li><a href="change-password.jsp">Change Password</a></li>
			<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		</div>
		<div style="float: left">
			<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
			<div><img src="images/save_2.jpg" style="width: 250px"></div>
		</div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
