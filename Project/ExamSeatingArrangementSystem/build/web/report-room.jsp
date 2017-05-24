<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Room roomDetails = new Room();
	String employeeID = "0";
	ArrayList allRoom = roomDetails.getAllRoom();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Room Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Name</th>
			  <th>Supervisor</th>
              <th>Floor</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allRoom.size();i++) 
			{ 
				HashMap RoomDetails = new HashMap();
				RoomDetails = (HashMap)allRoom.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(RoomDetails.get("room_name")); %></td>
				  <td><% out.print(RoomDetails.get("employee_name")); %></td>
				  <td><% out.print(RoomDetails.get("floor_name")); %></td>
				  <td> 
					<a href="room.jsp?room_id=<% out.print(RoomDetails.get("room_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allRoom.size() == 0) 
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
