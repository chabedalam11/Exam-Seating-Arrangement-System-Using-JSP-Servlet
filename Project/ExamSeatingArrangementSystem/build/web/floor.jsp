<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Floor floorDetails = new Floor();
	String floorLabel = "Save";
	int floor_id = Integer.parseInt(request.getParameter ("floor_id"));
	if(floor_id != 0) {
		floorLabel = "Update";
	}
	HashMap Values =  floorDetails.getFloorDetails(floor_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Floor Entry Form</h2>
        <form action="model/floor.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="floor_name" id="floor_name" value="<% out.print(Values.get("floor_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="floor_description" required><% out.print(Values.get("floor_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(floorLabel); %> Floor">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="floor_id" value="<% out.print(Values.get("floor_id")); %>"/>
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