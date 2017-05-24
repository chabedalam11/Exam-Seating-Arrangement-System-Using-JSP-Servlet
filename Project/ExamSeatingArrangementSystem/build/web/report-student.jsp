<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Student studentDetails = new Student();
	ArrayList allStudent = studentDetails.getAllStudent();
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Student Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Roll No</th>
              <th>Name</th>
              <th>Father Name</th>
              <th>Mobile</th>
              <th>Date of Birth</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allStudent.size();i++) 
			{ 
				HashMap StudentDetails = new HashMap();
				StudentDetails = (HashMap)allStudent.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(StudentDetails.get("student_rollno")); %></td>
				  <td><% out.print(StudentDetails.get("student_name")); %></td>
				  <td><% out.print(StudentDetails.get("student_father_name")); %></td>
				  <td><% out.print(StudentDetails.get("student_mobile")); %></td>
				  <td><% out.print(StudentDetails.get("student_dob")); %></td>
				  <td>
				  <a href="student.jsp?student_id=<% out.print(StudentDetails.get("student_id")); %>">Edit</a></td>
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
