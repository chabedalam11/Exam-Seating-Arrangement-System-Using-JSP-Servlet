<%@ include file="includes/header.jsp" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width:50%; margin:auto">
	  <div align="center" style="color:#FF0000"><% if(request.getParameter("msg")!=null) out.print(request.getParameter("msg")); %></div><br />
      <h2><% out.print(request.getParameter("title")); %> Login Form</h2>
        <form action="model/login.jsp" method="post" name="frm_login">
          <div>
            <label for="name">Username <span>*</span></label>
            <input type="text" name="login_user" id="name" value="" size="22" required>
          </div>
          <div>
            <label for="email">Password <span>*</span></label>
            <input type="password" name="login_password" id="email" value="" size="22" required>
          </div>
          <div>
            <input name="submit" type="submit" value="Login">
            &nbsp;
            <input name="reset" type="reset" value="Cancel">
			<input type="hidden" name="act" value="chk_login">
          </div>
		  <div><a href="forgot-password.jsp">Forgot Password</a></div>
        </form>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>
