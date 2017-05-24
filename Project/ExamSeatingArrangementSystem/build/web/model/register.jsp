<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Login login_obj = new Login();
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap login_data = new HashMap();
		login_data.put("login_user",request.getParameter("login_user"));
		login_data.put("login_password",request.getParameter("login_password"));
		login_data.put("login_email",request.getParameter("login_email"));
		login_data.put("login_sal",request.getParameter("login_sal"));
		login_data.put("login_first_name",request.getParameter("login_first_name"));
		login_data.put("login_middle_name",request.getParameter("login_middle_name"));
		login_data.put("login_last_name",request.getParameter("login_last_name"));
		login_data.put("login_gender",request.getParameter("login_gender"));
		login_data.put("login_address",request.getParameter("login_address"));
		login_data.put("login_village",request.getParameter("login_village"));
		login_data.put("login_state",request.getParameter("login_state"));
		login_data.put("login_country",request.getParameter("login_country"));
		login_data.put("login_landline",request.getParameter("login_landline"));
		login_data.put("login_mobile",request.getParameter("login_mobile"));
	
		if((request.getParameter("login_id")).equals(""))
		{
			login_obj.save_login(login_data);
			if(request.getParameter("login_id").equals(""))
			{
				response.sendRedirect("../login.jsp?msg=You have registered successfully.<br>Login to access your account.");
			}
			else
			{
				response.sendRedirect("../report-customer.jsp?msg=Customer Saved Successfully");
			}
		}
		else
		{
			login_data.put("login_id",request.getParameter("login_id"));
			login_obj.update_login(login_data);
			if(request.getParameter("login_id").equals(session.getAttribute("login_id")))
			{
				response.sendRedirect("../register.jsp?login_id=1&msg=Account Updated Successfully");
			}
			else
			{
				response.sendRedirect("../report-customer.jsp?msg=Customer Updated Successfully");
			}
		}
	}
	if((request.getParameter("act")).equals("delete"))
	{
		int login_id = Integer.parseInt(request.getParameter("login_id"));
		if(login_obj.delete_login(login_id))
			response.sendRedirect("../register.jsp?msg=Record Deleted Successfully");
		else
			response.sendRedirect("../register.jsp?msg=Problem in Deletion.");
	}
%>