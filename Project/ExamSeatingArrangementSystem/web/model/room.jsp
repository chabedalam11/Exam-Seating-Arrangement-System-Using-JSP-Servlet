<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Room roomObj = new Room();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		String room_floor_id = "";
		
		String[] facilityID = request.getParameterValues("room_floor_id");		
		///Save the Medicine Record ///
		for(int i=0;i<facilityID.length;i++)
		{
			room_floor_id += facilityID[i]+",";
		}		
		results.put("room_id",request.getParameter("room_id"));
		results.put("room_user_id",request.getParameter("room_user_id"));
		results.put("room_floor_id",request.getParameter("room_floor_id"));
		results.put("room_name",request.getParameter("room_name"));
		results.put("room_description",request.getParameter("room_description"));
		
		if((request.getParameter("room_id")).equals(""))
		{
			out.println(roomObj.saveRoom(results));
			response.sendRedirect("../report-room.jsp?emp_id="+emp_id+"&msg=Room Saved Successfully");
		}
		else
		{
			results.put("room_id",request.getParameter("room_id"));
			out.println(roomObj.updateRoom(results));
			response.sendRedirect("../report-room.jsp?emp_id=0&msg=Room Updated Successfully");
		}
	}
%>
