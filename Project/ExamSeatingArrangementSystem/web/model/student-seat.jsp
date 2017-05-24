<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	StudentSeat studentSeatObj = new StudentSeat();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		String ss_seat_id = "";
		
		///Save the Medicine Record ///
		results.put("ss_id",request.getParameter("ss_id"));
		results.put("ss_student_id",request.getParameter("ss_student_id"));
		results.put("ss_seat_id",request.getParameter("ss_seat_id"));
		results.put("ss_description",request.getParameter("ss_description"));
		
		if((request.getParameter("ss_id")).equals(""))
		{
			out.println(studentSeatObj.saveStudentSeat(results));
			response.sendRedirect("../report-student-seat.jsp?emp_id="+emp_id+"&msg=StudentSeat Saved Successfully");
		}
		else
		{
			results.put("ss_id",request.getParameter("ss_id"));
			out.println(studentSeatObj.updateStudentSeat(results));
			response.sendRedirect("../report-student-seat.jsp?emp_id=0&msg=StudentSeat Updated Successfully");
		}
	}
%>
