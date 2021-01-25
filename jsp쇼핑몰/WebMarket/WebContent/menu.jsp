	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class = "navbar navbar-expand fixed-top navbar-dark bg-dark">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav mr-auto">
     		<li class="nav-item active">
        		<a class="navbar-brand" href="./products.jsp">Home <span class="sr-only">(current)</span></a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="./products.jsp">Shop</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="./support.jsp">Support</a>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          		Dropdown link
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="#">Action</a>
          		<a class="dropdown-item" href="#">Another action</a>
          		<div class="dropdown-divider"></div>
          		<a class="dropdown-item" href="#">Something else here</a>
        		</div>
      		</li>
      		<li class="nav-item">
       			<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      		</li>
    	</ul>
    
    		<%
				if(userID == null) {
			%>	
				<form class="form-inline my-2 my-lg-0">
      				<a href="./login.jsp" class="btn btn-secondary my-2 my-sm-0"> Sign in &raquo;</a>
    			</form>
			<%		
				}
				else if(userID.equals("admin")) {
			%>	
				<div class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Product
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          			<a class="dropdown-item" href="./addProduct.jsp">Create</a>
          			<a class="dropdown-item" href="#">Update</a>
          		<div class="dropdown-divider"></div>
          			<a class="dropdown-item" href="#">Delete</a>
        		</div>
        		</div>
				<form class="form-inline my-2 my-lg-0">
      				<a href="./logoutAction.jsp" class="btn btn-secondary my-2 my-sm-0"> Logout &raquo;</a>
    			</form>
			<%		
				}
				else {
			%>
				<form class="form-inline my-2 my-lg-0">
      				<a href="./logoutAction.jsp" class="btn btn-secondary my-2 my-sm-0"> Logout &raquo;</a>
    			</form>	
			<%	
				}
			%>
    
  </div>
</nav>