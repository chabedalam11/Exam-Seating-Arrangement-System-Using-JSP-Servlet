<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Search Your Seat</h2>
        <form action="seat-details.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Enter your roll number :<span>*</span></label>
            <input type="text" name="student_roll" id="student_roll" size="22" style="width:300px;" required>
          </div>
          <div class="seat clear"></div>
          <div>
            <input name="submit" type="submit" value="Search Seat">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
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