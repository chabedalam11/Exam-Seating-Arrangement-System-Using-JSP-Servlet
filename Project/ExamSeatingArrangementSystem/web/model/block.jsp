<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Block blockObj = new Block();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("block_id",request.getParameter("block_id"));
		results.put("block_name",request.getParameter("block_name"));
		results.put("block_room_id",request.getParameter("block_room_id"));
		results.put("block_description",request.getParameter("block_description"));

		if((request.getParameter("block_id")).equals(""))
		{
			out.println(blockObj.saveBlock(results));
			response.sendRedirect("../report-block.jsp?emp_id="+emp_id+"&msg=Block Saved Successfully");
		}
		else
		{
			results.put("block_id",request.getParameter("block_id"));
			out.println(blockObj.updateBlock(results));
			response.sendRedirect("../report-block.jsp?emp_id=0&msg=Block Updated Successfully");
		}
	}
%>
