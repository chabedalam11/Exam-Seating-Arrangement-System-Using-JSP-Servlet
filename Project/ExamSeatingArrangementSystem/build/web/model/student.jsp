<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Student student = new Student();
	String emp_id = "0";
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		
		results.put("student_course_id",request.getParameter("student_course_id"));
		results.put("student_rollno",request.getParameter("student_rollno"));
		results.put("student_name",request.getParameter("student_name"));
		results.put("student_father_name",request.getParameter("student_father_name"));
		results.put("student_dob",request.getParameter("student_dob"));
		results.put("student_mobile",request.getParameter("student_mobile"));
		results.put("student_details",request.getParameter("student_details"));
		results.put("student_id",request.getParameter("student_id"));			
		
						
		if((request.getParameter("student_id")).equals(""))
		{
			out.println(student.saveStudent(results));
			response.sendRedirect("../report-student.jsp?msg=Student Saved Successfully");
		}
		else
		{
			results.put("student_id",request.getParameter("student_id"));
			out.println(student.updateStudent(results));
			response.sendRedirect("../report-student.jsp?msg=Student Updated Successfully");
		}			
	}
%>
