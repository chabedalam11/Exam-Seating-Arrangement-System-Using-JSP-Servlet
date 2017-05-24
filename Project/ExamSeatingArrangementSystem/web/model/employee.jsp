<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Login login_obj = new Login();
	Employee employee_obj = new Employee();
	
	/////Check Username and Password for the Employee //////
	if((request.getParameter("employee_id")).equals("")) {
		if(login_obj.checkUsernameExits(request.getParameter("employee_user"),1) >= 1) {
			response.sendRedirect("../employee.jsp?employee_id=0&type=error&msg=Username already exits. Kindly choose another !!!!!!");
			return;
		}
		if(login_obj.checkUsernameExits(request.getParameter("employee_email"),2) >= 1) {
			response.sendRedirect("../employee.jsp?employee_id=0&type=error&msg=Email ID already exits. Kindly choose another !!!!!!");		
			return;
		}
	}
	
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap employee_data = new HashMap();
		String managerID = request.getParameter("employee_manager_id");
		String roleID = request.getParameter("employee_role");
		
		if(managerID == null) {
			managerID = "1001";
		}
		
		if(roleID == null) {
			roleID = "3";
		}
		
		employee_data.put("employee_id",request.getParameter("employee_id"));
		employee_data.put("employee_user",request.getParameter("employee_user"));
		employee_data.put("employee_password",request.getParameter("employee_password"));
		employee_data.put("employee_sal",request.getParameter("employee_sal"));
		employee_data.put("employee_first_name",request.getParameter("employee_first_name"));
		employee_data.put("employee_middle_name",request.getParameter("employee_middle_name"));
		employee_data.put("employee_last_name",request.getParameter("employee_last_name"));
		employee_data.put("employee_gender",request.getParameter("employee_gender"));
		employee_data.put("employee_address",request.getParameter("employee_address"));
		employee_data.put("employee_village",request.getParameter("employee_village"));
		employee_data.put("employee_state",request.getParameter("employee_state"));
		employee_data.put("employee_country",request.getParameter("employee_country"));
		employee_data.put("employee_landline",request.getParameter("employee_landline"));
		employee_data.put("employee_mobile",request.getParameter("employee_mobile"));
		employee_data.put("employee_email",request.getParameter("employee_email"));
		employee_data.put("employee_status",request.getParameter("employee_status"));
		employee_data.put("employee_deparment",request.getParameter("employee_deparment"));
		employee_data.put("employee_dob",request.getParameter("employee_dob"));
		employee_data.put("employee_nationalty",request.getParameter("employee_nationalty"));
		employee_data.put("employee_manager_id",managerID);
		employee_data.put("employee_role",roleID);
	
	
		if((request.getParameter("employee_id")).equals(""))
		{
			out.print(employee_obj.saveEmployee(employee_data));
			if(session.getAttribute("login_level") == null)
			{
				response.sendRedirect("../login.jsp?msg=You have registered successfully.<br>Login to access your account.");
			}
			else
			{
				response.sendRedirect("../report-employee.jsp?msg=Employee Saved Successfully");
			}
		}
		else
		{
			employee_data.put("employee_id",request.getParameter("employee_id"));
			out.print(employee_obj.updateEmployee(employee_data));
			
			if(request.getParameter("employee_id").equals(session.getAttribute("login_emp_id")))
			{
				response.sendRedirect("../employee.jsp?employee_id="+session.getAttribute("login_emp_id")+"&msg=Account Updated Successfully");
			}
			else
			{
				response.sendRedirect("../report-employee.jsp?msg=Employee Updated Successfully");
			}
		}
	}
	if((request.getParameter("act")).equals("delete"))
	{
		int employee_id = Integer.parseInt(request.getParameter("employee_id"));
		if(employee_obj.deleteEmployee(employee_id))
			response.sendRedirect("../register.jsp?msg=Record Deleted Successfully");
		else
			response.sendRedirect("../register.jsp?msg=Problem in Deletion.");
	}
%>
