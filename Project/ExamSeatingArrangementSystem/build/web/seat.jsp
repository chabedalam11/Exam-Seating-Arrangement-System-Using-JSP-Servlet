<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Seat seatDetails = new Seat();
	String seatLabel = "Save";
	int seat_id = Integer.parseInt(request.getParameter ("seat_id"));
	if(seat_id != 0) {
		seatLabel = "Update";
	}
	HashMap Values =  seatDetails.getSeatDetails(seat_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Seat Entry Form</h2>
        <form action="model/seat.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Seat Number<span>*</span></label>
            <input type="text" name="seat_number" id="seat_number" value="<% out.print(Values.get("seat_number")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Select Block<span>*</span></label>
            <select style="height: 40px; width:300px" name = "seat_block_id" id = "seat_block_id" required>
            	<% out.print(seatDetails.getBlockOption((Integer) Values.get("seat_block_id"))); %>
            </select>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="seat_description" required><% out.print(Values.get("seat_description")); %></textarea>
          </div>
          <div class="seat clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(seatLabel); %> Seat">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="seat_id" value="<% out.print(Values.get("seat_id")); %>"/>
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