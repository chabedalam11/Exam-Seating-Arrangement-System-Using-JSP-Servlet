<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Seat seatDetails = new Seat();
	ArrayList allSeat = seatDetails.getAllSeat();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Seat Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Seat Number</th>
			  <th>Block Name</th>
			  <th>Room Name</th>
			  <th>Floor Name</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allSeat.size();i++) 
			{ 
				HashMap SeatDetails = new HashMap();
				SeatDetails = (HashMap)allSeat.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(SeatDetails.get("seat_number")); %></td>
				  <td><% out.print(SeatDetails.get("block_name")); %></td>
				  <td><% out.print(SeatDetails.get("room_name")); %></td>
				  <td><% out.print(SeatDetails.get("floor_name")); %></td>
				  <td><% out.print(SeatDetails.get("seat_description")); %></td>
				  <td> 
					<a href="seat.jsp?seat_id=<% out.print(SeatDetails.get("seat_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allSeat.size() == 0) 
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
