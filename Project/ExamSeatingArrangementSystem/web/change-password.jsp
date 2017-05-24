<%@ include file="includes/header.jsp" %>
<script>
function isValid(frm_obj)
{
	if(frm_obj.old_password.value == "")
	{
		frm_obj.old_password.focus();
		alert("Please enter the old password.")
		return false;
	}
	if(frm_obj.new_password.value == "")
	{
		frm_obj.new_password.focus();
		alert("Please enter the new password.")
		return false;
	}
	if(frm_obj.confirm_password.value == "")
	{
		frm_obj.confirm_password.focus();
		alert("Please enter the confirm password.")
		return false;
	}
	if(frm_obj.confirm_password.value != frm_obj.new_password.value)
	{
		frm_obj.new_password.focus();
		alert("New Password and confirm password doesnot match.")
		return false;
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width:50%; margin:auto">
      <h2>Change Password Form</h2>
	  <% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <form action="model/login.jsp?act=change_password" method="post" onsubmit="return isValid(this)">
          <div>
            <label for="name">Old Password <span>*</span></label>
            <input type="password" name="old_password" id="old_password" value="" size="22">
          </div>
          <div>
            <label for="email">New Password <span>*</span></label>
            <input type="password" name="new_password" id="new_password" value="" size="22">
          </div>
          <div>
            <label for="email">Confirm Password <span>*</span></label>
            <input type="password" name="confirm_password" id="confirm_password" value="" size="22">
          </div>
          <div>
            <input name="submit" type="submit" value="Reset Password">
            &nbsp;
            <input name="reset" type="reset" value="Cancel">
			<input type="hidden" name="login_id" value="<%=session.getAttribute("login_id")%>">
          </div>
        </form>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
