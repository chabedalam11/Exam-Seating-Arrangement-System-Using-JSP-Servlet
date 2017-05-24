<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	StudentSeat roomDetails = new StudentSeat();
	String employeeID = "0";
	ArrayList allStudentSeat = roomDetails.getAllStudentSeat();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Student Seat Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Roll No</th>
			  <th>Student Name</th>
              <th>Floor</th>
			  <th>Room</th>
			  <th>Block</th>
			  <th>Seat</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allStudentSeat.size();i++) 
			{ 
				HashMap StudentSeatDetails = new HashMap();
				StudentSeatDetails = (HashMap)allStudentSeat.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(StudentSeatDetails.get("student_rollno")); %></td>
				  <td><% out.print(StudentSeatDetails.get("student_name")); %></td>
				  <td><% out.print(StudentSeatDetails.get("floor_name")); %></td>
				  <td><% out.print(StudentSeatDetails.get("room_name")); %></td>
				  <td><% out.print(StudentSeatDetails.get("block_name")); %></td>
				  <td><% out.print(StudentSeatDetails.get("seat_number")); %></td>
				  <td> 
					<a href="student_seat.jsp?ss_id=<% out.print(StudentSeatDetails.get("ss_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allStudentSeat.size() == 0) 
			{
			%>
				<tr>
					<td colspan="5">No Records Found !!!</td>
				</tr>
			<%
			}
			%>
			</tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
