<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Seat seatObj = new Seat();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		String seat_block_id = "";
		
		String[] facilityID = request.getParameterValues("seat_block_id");		
		///Save the Medicine Record ///
		for(int i=0;i<facilityID.length;i++)
		{
			seat_block_id += facilityID[i]+",";
		}		
		results.put("seat_id",request.getParameter("seat_id"));
		results.put("seat_block_id",request.getParameter("seat_block_id"));
		results.put("seat_number",request.getParameter("seat_number"));
		results.put("seat_description",request.getParameter("seat_description"));
		
		if((request.getParameter("seat_id")).equals(""))
		{
			out.println(seatObj.saveSeat(results));
			response.sendRedirect("../report-seat.jsp?emp_id="+emp_id+"&msg=Seat Saved Successfully");
		}
		else
		{
			results.put("seat_id",request.getParameter("seat_id"));
			out.println(seatObj.updateSeat(results));
			response.sendRedirect("../report-seat.jsp?emp_id=0&msg=Seat Updated Successfully");
		}
	}
%>
