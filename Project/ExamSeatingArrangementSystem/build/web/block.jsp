<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Block blockDetails = new Block();
	String blockLabel = "Save";
	int block_id = Integer.parseInt(request.getParameter ("block_id"));
	if(block_id != 0) {
		blockLabel = "Update";
	}
	HashMap Values =  blockDetails.getBlockDetails(block_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Block Entry Form</h2>
        <form action="model/block.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="block_name" id="block_name" value="<% out.print(Values.get("block_name")); %>" size="22" style="width:300px;" required>
          </div>
		  <div>
            <label for="email">Select Room<span>*</span></label>
            <select style="height: 40px; width:300px" name = "block_room_id" id = "block_room_id" required>
            	<% out.print(blockDetails.getRoomOption((Integer) Values.get("block_room_id"))); %>
            </select>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="block_description" required><% out.print(Values.get("block_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(blockLabel); %> Block">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="block_id" value="<% out.print(Values.get("block_id")); %>"/>
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