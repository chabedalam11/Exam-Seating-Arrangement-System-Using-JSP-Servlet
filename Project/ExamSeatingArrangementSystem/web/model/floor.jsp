<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Floor floorObj = new Floor();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("floor_id",request.getParameter("floor_id"));
		results.put("floor_name",request.getParameter("floor_name"));
		results.put("floor_description",request.getParameter("floor_description"));

		if((request.getParameter("floor_id")).equals(""))
		{
			out.println(floorObj.saveFloor(results));
			response.sendRedirect("../report-floor.jsp?emp_id="+emp_id+"&msg=Floor Saved Successfully");
		}
		else
		{
			results.put("floor_id",request.getParameter("floor_id"));
			out.println(floorObj.updateFloor(results));
			response.sendRedirect("../report-floor.jsp?emp_id=0&msg=Floor Updated Successfully");
		}
	}
%>
