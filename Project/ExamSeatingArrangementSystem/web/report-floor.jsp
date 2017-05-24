<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Floor floorDetails = new Floor();
	ArrayList allFloor = floorDetails.getAllFloor();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Floor Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Floor Name</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allFloor.size();i++) 
			{ 
				HashMap FloorDetails = new HashMap();
				FloorDetails = (HashMap)allFloor.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(FloorDetails.get("floor_name")); %></td>
				  <td><% out.print(FloorDetails.get("floor_description")); %></td>
				  <td> 
					<a href="floor.jsp?floor_id=<% out.print(FloorDetails.get("floor_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allFloor.size() == 0) 
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
