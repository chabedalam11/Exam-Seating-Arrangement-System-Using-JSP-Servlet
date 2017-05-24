<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Room roomDetails = new Room();
	String roomLabel = "Save";
	int room_id = Integer.parseInt(request.getParameter ("room_id"));
	if(room_id != 0) {
		roomLabel = "Update";
	}
	HashMap Values =  roomDetails.getRoomDetails(room_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Room Entry Form</h2>
        <form action="model/room.jsp" method="post">
		  <div id="room_status_row">
            <label for="email">Room Name<span>*</span></label>
			<input type="text" name="room_name" id="room_name" value="<% out.print(Values.get("room_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Select Floor<span>*</span></label>
            <select style="height: 40px; width:300px" name = "room_floor_id" id = "room_floor_id" required>
                
            	<% out.print(roomDetails.getFloorOption((Integer) Values.get("room_floor_id"))); %>
            </select>
          </div>
		  <div>
            <label for="email">Select Supervisor<span>*</span></label>
            <select style="height: 40px; width:300px" name = "room_user_id" id = "room_user_id" required>
            	<% out.print(roomDetails.getUserOption((Integer) Values.get("room_user_id"))); %>
            </select>
          </div>
		  <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="room_description" required><% out.print(Values.get("room_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(roomLabel); %> Room">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="room_id" value="<% out.print(Values.get("room_id")); %>"/>
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
