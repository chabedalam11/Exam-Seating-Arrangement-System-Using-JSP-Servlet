<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Employee employeeDetails = new Employee();
	int employee_id = Integer.parseInt(request.getParameter ("employee_id"));
	String male = "";
	String female = "";
	HashMap Values =  employeeDetails.getEmployeeDetails(employee_id);
	if(Values.get("employee_gender").equals("Male"))
	{
		male = "Selected";
	}
	else if(Values.get("employee_gender").equals("Female"))
	{
		female = "Selected";
	}
%>
<script>
  jQuery(function() {
    jQuery( "#employee_dob" ).datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-50:-18",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Registration Form</h2>
	  <% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <form action="model/employee.jsp" method="post">
       	  <div class="one_third first">
            <label for="email">Salution <span>*</span></label>
            <select style="height: 40px; width:200px" name="employee_sal" required>
            	<% out.print(employeeDetails.getSalutionOption((Integer) Values.get("employee_sal"))); %>
            </select>
          </div>
		<div class="one_third">
            <label for="email">Status<span>*</span></label>
            <select style="height: 40px; width:200px" name= "employee_status" id = "employee_status" required>
			<% out.print(employeeDetails.getStatusOption((Integer) Values.get("employee_status"))); %>
			</select>
          </div>
	  <div class="one_third">
            <label for="email">Department<span>*</span></label>
            <select style="height: 40px; width:200px" name = "employee_deparment" id = "employee_deparment" required>
		<% out.print(employeeDetails.getDepartmentOption((Integer) Values.get("employee_deparment"))); %>
	    </select>
          </div>
          <div class="one_third first">
            <label for="email">First Name <span>*</span></label>
            <input type="text" name="employee_first_name" id="employee_first_name" value="<% out.print(Values.get("employee_first_name")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Middle Name <span>*</span></label>
            <input type="text" name="employee_middle_name" id="employee_middle_name" value="<% out.print(Values.get("employee_middle_name")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Last Name</label>
            <input type="text" name="employee_last_name" id="employee_last_name" value="<% out.print(Values.get("employee_last_name")); %>" size="22" required>
          </div>
          <div  class="one_third first">
            <label for="url">Gender</label>
            <select style="height: 40px; width:200px" name="employee_gender" required>
				<option value="0">Please Select</option>
            	<option value="Male" <% out.print(male); %>>Male</option>
            	<option value="Female" <% out.print(female); %>>Female</option>
            </select>
          </div>

	  <div class="one_third">
            <label for="url">Date of Birth</label>
			<input type="text" name="employee_dob" id="employee_dob" value="<% out.print(Values.get("employee_dob")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Nationality</label>
            <input type="text" name="employee_nationalty" id="employee_nationalty" value="<% out.print(Values.get("employee_nationalty")); %>" size="22" required>
          </div>
          
	  <div class="one_third first">
            <label for="url">E-mail</label>
            <input type="text" name="employee_email" id="employee_email" value="<% out.print(Values.get("employee_email")); %>" size="22" required>
          </div>
	  <div class="one_third">
            <label for="url">Landline</label>
            <input type="text" name="employee_landline" id="employee_landline" value="<% out.print(Values.get("employee_landline")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Mobile</label>
            <input type="text" name="employee_mobile" id="employee_mobile" value="<% out.print(Values.get("employee_mobile")); %>" size="22" required>
          </div>
          
	  <div style="clear:both"></div>
          <h4>Address Details</h4>
          <div class="one_third first">
            <label for="url">Address</label>
            <input type="text" name="employee_address" id="employee_address" value="<% out.print(Values.get("employee_address")); %>" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Village/City/Town</label>
            <input type="text" name="employee_village" id="employee_village" value="<% out.print(Values.get("employee_village")); %>" size="22" required>	
          </div>
          <div class="one_third">
            <label for="url">State</label>
            <select style="height: 40px; width:200px" name="employee_state" required>
				<% out.print(employeeDetails.getStateOption((Integer) Values.get("employee_state"))); %>
            </select>
          </div>
          <div class="one_third first">
            <label for="url">Country</label>
            <select style="height: 40px; width:200px" name="employee_country" required>
				<% out.print(employeeDetails.getCountryOption((Integer) Values.get("employee_country"))); %>
            </select>
          </div>
          <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>
          <div class="block clear"></div>
		   <h4>Role & Manager</h4>
		    <div class="one_third first">
            <label for="email">Role<span>*</span></label>
            <select style="height: 40px; width:200px" name= "employee_role" id = "employee_role" required>
			<% out.print(employeeDetails.getRoleOption((Integer) Values.get("employee_role"))); %>
			</select>
          </div>
           <div class="one_third">
            <label for="email">Manager Code<span>*</span></label>
            <select style="height: 40px; width:200px" name = "employee_manager_id" id = "employee_manager_id" required>
            	<% out.print(employeeDetails.getEmployeeOption((Integer) Values.get("employee_manager_id"))); %>
            </select>
          </div>
          <% } %>
          <div class="block clear"></div>
		  <% if(employee_id == 0) { %>
          <h4>Login Details</h4>
          <div class="one_third first">
            <label for="url">Username</label>
            <input type="text" name="employee_user" id="employee_user" value="<% out.print(Values.get("employee_user")); %>" size="22">
          </div>
          
          <div class="one_third">
            <label for="url">Password</label>
            <input type="password" name="employee_password" id="employee_password" value="" size="22">
          </div>
          
          <div class="one_third ">
            <label for="url">Confirm Password</label>
            <input type="password" name="employee_confirm_password" id="employee_confirm_password" value="" size="22">
          </div>
		  <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Form">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="employee_id" value="<% out.print(Values.get("employee_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div><br>
		<div><img src="images/save_3.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
