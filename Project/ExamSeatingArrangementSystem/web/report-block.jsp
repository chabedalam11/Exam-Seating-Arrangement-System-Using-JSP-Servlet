<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Block blockDetails = new Block();
	ArrayList allBlock = blockDetails.getAllBlock();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Block Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Block Name</th>
			  <th>Room Name</th>
			  <th>Floor Name</th>
              <th>Description</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allBlock.size();i++) 
			{ 
				HashMap BlockDetails = new HashMap();
				BlockDetails = (HashMap)allBlock.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(BlockDetails.get("block_name")); %></td>
				  <td><% out.print(BlockDetails.get("room_name")); %></td>
				  <td><% out.print(BlockDetails.get("floor_name")); %></td>
				  <td><% out.print(BlockDetails.get("block_description")); %></td>
				  <td> 
					<a href="block.jsp?block_id=<% out.print(BlockDetails.get("block_id")); %>">Edit</a>
				  </td>
				</tr>
			<%
			}
			if(allBlock.size() == 0) 
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
