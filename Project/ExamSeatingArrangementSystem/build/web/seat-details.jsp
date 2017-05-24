<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	StudentSeat seatDetails = new StudentSeat();
	String seat_id = request.getParameter ("student_roll");
	HashMap Values =  seatDetails.getStudentSeats(seat_id);
	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Student Seat Assign Card</h2>
		<% if(!Values.get("ss_id").equals("")) { %>
        <table>
          <thead>
            <tr>
              <th>Roll Number</th>
			  <td><% out.print(Values.get("student_rollno")); %></td>
            </tr>
			<tr>
              <th>Name</th>
			  <td><% out.print(Values.get("student_name")); %></td>
            </tr>
			<tr>
              <th>Father Name</th>
			  <td><% out.print(Values.get("student_father_name")); %></td>
            </tr>
			<tr>
              <th>Seat Number</th>
			  <td><% out.print(Values.get("seat_number")); %></td>
            </tr>
			<tr>
              <th>Block Number</th>
			  <td><% out.print(Values.get("block_name")); %></td>
            </tr>
			<tr>
              <th>Room Number</th>
			  <td><% out.print(Values.get("room_name")); %></td>
            </tr>
			<tr>
              <th>Floor</th>
			  <td><% out.print(Values.get("floor_name")); %></td>
            </tr>
          </thead>
        </table>
		<div style="float:right">
			<input name="submit" type="button" value="Print Card" style="background-color:#4d0b0d; padding:10px 15px; font-weight:bold; color:#ffffff" onClick="window.print()">
		</div>
		<% } else { %>
		<div class="msg">No roll number and seat details found !!!! Try again</div>
		<% } %>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
