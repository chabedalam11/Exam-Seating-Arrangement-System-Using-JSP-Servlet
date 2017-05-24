<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Student studentDetails = new Student();
	int student_id = Integer.parseInt(request.getParameter ("student_id"));
	HashMap Values =  studentDetails.getStudentDetails(student_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <% if(request.getParameter("msg") != null) { %>
	<div class="msg"><%=request.getParameter("msg") %></div>
	<% } %>
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Student Entry Form</h2>
		<form method="post" action="model/student.jsp">
          <div class="half_width">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="student_name" id="student_name" value="<% out.print(Values.get("student_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Father Name<span>*</span></label>
            <input type="text" name="student_father_name" id="student_father_name" value="<% out.print(Values.get("student_father_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Roll Number<span>*</span></label>
            <input type="text" name="student_rollno" id="student_rollno" value="<% out.print(Values.get("student_rollno")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="email">Date of Birth<span>*</span></label>
            <input type="text" name="student_dob" id="student_dob" value="<% out.print(Values.get("student_dob")); %>" size="22" style="width:300px;" required>
          </div>
		  <div class="half_width">
            <label for="url">Course</label>
            <select style="height: 40px; width:300px" name="student_course_id" required>
				<% out.print(studentDetails.getCourseOption((Integer) Values.get("student_course_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Mobile<span>*</span></label>
            <input type="text" name="student_mobile" id="student_mobile" value="<% out.print(Values.get("student_mobile")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Other Details<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="student_details" required><% out.print(Values.get("student_details")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Student">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("student_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" id="student_id" name="student_id" value="<% out.print(Values.get("student_id")); %>"/>
        </form>
        </div>
        <div style="float: left">
        	<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
        	<div><img src="images/save_2.jpg" style="width: 250px"></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
