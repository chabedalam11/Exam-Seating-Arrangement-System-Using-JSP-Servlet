<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	StudentSeat studentSeatDetails = new StudentSeat();
	String studentSeatLabel = "Save";
	int ss_id = Integer.parseInt(request.getParameter ("ss_id"));
	if(ss_id != 0) {
		studentSeatLabel = "Update";
	}
	HashMap Values =  studentSeatDetails.getStudentSeatDetails(ss_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>StudentSeat Entry Form</h2>
        <form action="model/student-seat.jsp" method="post">
		  <div class="half_width">
            <label for="email">Select Roll Number<span>*</span></label>
            <select style="height: 40px; width:300px" name = "ss_student_id" id = "ss_student_id" required>
            	<% out.print(studentSeatDetails.getStudentOption((Integer) Values.get("ss_student_id"))); %>
            </select>
          </div>
		  <div class="half_width">
            <label for="email">Select Seat<span>*</span></label>
            <select style="height: 40px; width:300px" name = "ss_seat_id" id = "ss_seat_id" required>
            	<% out.print(studentSeatDetails.getSeatOption((Integer) Values.get("ss_seat_id"))); %>
            </select>
          </div>
		  <div class="half_width">
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="ss_description" required><% out.print(Values.get("ss_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(studentSeatLabel); %> StudentSeat">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="ss_id" value="<% out.print(Values.get("ss_id")); %>"/>
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
